
package Roles;


import tthh.postgresql.Conexion;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author JossueG
 */
public class ModificarRol2 extends javax.swing.JFrame {

    private DefaultTableModel modeloTabla;
    
    public ModificarRol2(String nombre, String cedula, String nomina, String periodo, String dependencia, 
                     String fechaInicio, String fechaFin, double sueldo, double bonificaciones, double descuentos, double valorNeto) {
         initComponents();
    
    //Asignar valores a los labels
    Nombre.setText(nombre);
    Cedula.setText(cedula);
    Nomina.setText(nomina);
    Periodo.setText(periodo);
    Dependencia.setText(dependencia);
    PrimerDia.setText(fechaInicio);
    UltimoDia.setText(fechaFin);
    
    //Inicializar el modelo de la tabla
    modeloTabla = new DefaultTableModel();
    modeloTabla.addColumn("Clave");
    modeloTabla.addColumn("Concepto");
    modeloTabla.addColumn("Ingresos");
    modeloTabla.addColumn("Descuentos");
    jTable2.setModel(modeloTabla);

    String idEmpleado = obtenerIdEmpleado(cedula);

    //Cargar el rol de pago en la tabla
    cargarRolDePagos(idEmpleado, periodo);

    actualizarTotales();
}
    
    
    private void cargarRolDePagos(String idEmpleado, String idPago) {
    try (Connection conexion = Conexion.conectar()) {
        
        //Cargar el sueldo base
        String sqlSueldo = "SELECT emp_Sueldo FROM PagxEmp WHERE id_Empleado = ? AND id_Pago = ?";
        try (PreparedStatement psSueldo = conexion.prepareStatement(sqlSueldo)) {
            psSueldo.setString(1, idEmpleado);
            psSueldo.setString(2, idPago);
            ResultSet rsSueldo = psSueldo.executeQuery();

            if (rsSueldo.next()) {
                double sueldo = rsSueldo.getDouble("emp_Sueldo");
                modeloTabla.addRow(new Object[]{"1000", "Sueldo Mensual", sueldo, ""});
            }
        }

        //Cargar las bonificaciones
        String sqlBonificaciones = "SELECT b.id_Bonificacion, b.bon_Descripcion, b.bon_Valor " +
                                   "FROM BonxEmpxPag bep " +
                                   "JOIN Bonificaciones b ON bep.id_Bonificacion = b.id_Bonificacion " +
                                   "WHERE bep.id_Empleado = ? AND bep.id_Pago = ? AND b.ESTADO_BON = 'ACT'";
        try (PreparedStatement psBonificaciones = conexion.prepareStatement(sqlBonificaciones)) {
            psBonificaciones.setString(1, idEmpleado);
            psBonificaciones.setString(2, idPago);
            ResultSet rsBonificaciones = psBonificaciones.executeQuery();

            while (rsBonificaciones.next()) {
                String idBonificacion = rsBonificaciones.getString("id_Bonificacion");
                String descripcion = rsBonificaciones.getString("bon_Descripcion");
                double valor = rsBonificaciones.getDouble("bon_Valor");
                modeloTabla.addRow(new Object[]{idBonificacion, descripcion, valor, ""});
            }
        }

        //Cargar los descuentos
        String sqlDescuentos = "SELECT d.id_Descuento, d.des_Descripcion, d.des_Valor " +
                               "FROM DesxEmpxPag dep " +
                               "JOIN Descuentos d ON dep.id_Descuento = d.id_Descuento " +
                               "WHERE dep.id_Empleado = ? AND dep.id_Pago = ? AND d.ESTADO_DES = 'ACT'";
        try (PreparedStatement psDescuentos = conexion.prepareStatement(sqlDescuentos)) {
            psDescuentos.setString(1, idEmpleado);
            psDescuentos.setString(2, idPago);
            ResultSet rsDescuentos = psDescuentos.executeQuery();

            while (rsDescuentos.next()) {
                String idDescuento = rsDescuentos.getString("id_Descuento");
                String descripcion = rsDescuentos.getString("des_Descripcion");
                double valor = rsDescuentos.getDouble("des_Valor");
                modeloTabla.addRow(new Object[]{idDescuento, descripcion, "", valor});
            }
        }

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar el rol de pagos: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}

    
    //Método para obtener el sueldo del empleado y agregarlo a la tabla
    private void agregarSueldoEmpleado(String cedulaEmpleado) {
        try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(
             "SELECT emp_Sueldo FROM Empleados WHERE emp_Cedula = ?")) {
        
        ps.setString(1, cedulaEmpleado);
        ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            double sueldo = rs.getDouble("emp_Sueldo");
            
            //Agregar el sueldo a la tabla con clave 1000 y concepto "Sueldo Mensual"
            modeloTabla.addRow(new Object[]{"1000", "Sueldo Mensual", sueldo, ""});
            }

        } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar el sueldo: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void actualizarTotales() {
    double totalIngresos = 0.0;
    double totalDescuentos = 0.0;

    //Recorrer todas las filas de la tabla y sumar ingresos y descuentos
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
        // Obtener valores de las columnas "Ingresos" y "Descuentos"
        Object ingresoObj = modeloTabla.getValueAt(i, 2);
        Object descuentoObj = modeloTabla.getValueAt(i, 3);

        // Convertir valores a double si no son nulos
         if (ingresoObj != null && !ingresoObj.toString().isEmpty()) {
            totalIngresos += Double.parseDouble(ingresoObj.toString());
            }
            if (descuentoObj != null && !descuentoObj.toString().isEmpty()) {
            totalDescuentos += Double.parseDouble(descuentoObj.toString());
            }
        }

    //Calcular total neto (
    double totalNeto = totalIngresos - totalDescuentos;

    //Actualizar los JLabel
    Ingresos.setText(String.format("%.2f", totalIngresos));
    Descuentos.setText(String.format("%.2f", totalDescuentos));
    Total.setText(String.format("%.2f", totalNeto));
    }

    private String obtenerIdEmpleado(String cedulaEmpleado) {
        String idEmpleado = "";
        try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement("SELECT id_Empleado FROM Empleados WHERE emp_Cedula = ?")) {
        
        ps.setString(1, cedulaEmpleado);
        ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                idEmpleado = rs.getString("id_Empleado");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error al obtener ID del empleado: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return idEmpleado;
    }


    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanelCabecera = new javax.swing.JPanel();
        jPanelTituloCabecera = new javax.swing.JPanel();
        Titulo = new javax.swing.JLabel();
        jPanelDatosCabecera = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        Nombre = new javax.swing.JLabel();
        Cedula = new javax.swing.JLabel();
        Nomina = new javax.swing.JLabel();
        Periodo = new javax.swing.JLabel();
        Dependencia = new javax.swing.JLabel();
        jPanelFechasCabecera = new javax.swing.JPanel();
        PrimerDia = new javax.swing.JLabel();
        UltimoDia = new javax.swing.JLabel();
        jPanelFondoFactura = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jPanel4Ingresos = new javax.swing.JPanel();
        Ingresos = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        Descuentos = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jPanel4Ingresos1 = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        jPanel5 = new javax.swing.JPanel();
        Total = new javax.swing.JLabel();
        jButtonGuardar = new javax.swing.JButton();
        jButtonEliminar = new javax.swing.JButton();
        jButtonPagar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Modificar Rol de Pagos");

        jPanel1.setBackground(new java.awt.Color(102, 102, 102));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(0, 102, 153));

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 12)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("X");

        jLabel1.setFont(new java.awt.Font("Segoe UI Emoji", 1, 12)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Modificar Rol de Pagos");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 749, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(256, 256, 256))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel1))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1150, 30));

        jPanelCabecera.setBackground(new java.awt.Color(221, 223, 227));

        jPanelTituloCabecera.setBackground(new java.awt.Color(51, 153, 255));
        jPanelTituloCabecera.setForeground(new java.awt.Color(51, 153, 255));

        Titulo.setForeground(new java.awt.Color(255, 255, 255));
        Titulo.setText("ROL DE PAGOS ");

        javax.swing.GroupLayout jPanelTituloCabeceraLayout = new javax.swing.GroupLayout(jPanelTituloCabecera);
        jPanelTituloCabecera.setLayout(jPanelTituloCabeceraLayout);
        jPanelTituloCabeceraLayout.setHorizontalGroup(
            jPanelTituloCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelTituloCabeceraLayout.createSequentialGroup()
                .addContainerGap(249, Short.MAX_VALUE)
                .addComponent(Titulo, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(202, 202, 202))
        );
        jPanelTituloCabeceraLayout.setVerticalGroup(
            jPanelTituloCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(Titulo, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
        );

        jPanelDatosCabecera.setBackground(new java.awt.Color(51, 153, 255));

        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Nombre:");

        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Cédula:");

        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Nomina:");

        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Periodo:");

        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Dependencia:");

        Nombre.setForeground(new java.awt.Color(255, 255, 255));
        Nombre.setText("jLabel4");

        Cedula.setForeground(new java.awt.Color(255, 255, 255));
        Cedula.setText("jLabel5");

        Nomina.setForeground(new java.awt.Color(255, 255, 255));
        Nomina.setText("jLabel8");

        Periodo.setForeground(new java.awt.Color(255, 255, 255));
        Periodo.setText("jLabel8");

        Dependencia.setForeground(new java.awt.Color(255, 255, 255));
        Dependencia.setText("jLabel10");

        javax.swing.GroupLayout jPanelDatosCabeceraLayout = new javax.swing.GroupLayout(jPanelDatosCabecera);
        jPanelDatosCabecera.setLayout(jPanelDatosCabeceraLayout);
        jPanelDatosCabeceraLayout.setHorizontalGroup(
            jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelDatosCabeceraLayout.createSequentialGroup()
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 54, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5)
                    .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addGap(71, 71, 71)
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(Cedula, javax.swing.GroupLayout.DEFAULT_SIZE, 62, Short.MAX_VALUE)
                        .addComponent(Nombre, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(Periodo, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(Nomina, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanelDatosCabeceraLayout.createSequentialGroup()
                        .addGap(1, 1, 1)
                        .addComponent(Dependencia, javax.swing.GroupLayout.PREFERRED_SIZE, 171, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanelDatosCabeceraLayout.setVerticalGroup(
            jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelDatosCabeceraLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(Nombre))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(Cedula, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(Nomina))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(Periodo, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelDatosCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(Dependencia))
                .addContainerGap(21, Short.MAX_VALUE))
        );

        jPanelFechasCabecera.setBackground(new java.awt.Color(51, 153, 255));

        PrimerDia.setForeground(new java.awt.Color(255, 255, 255));
        PrimerDia.setText("jLabel6");

        UltimoDia.setForeground(new java.awt.Color(255, 255, 255));
        UltimoDia.setText("jLabel6");

        javax.swing.GroupLayout jPanelFechasCabeceraLayout = new javax.swing.GroupLayout(jPanelFechasCabecera);
        jPanelFechasCabecera.setLayout(jPanelFechasCabeceraLayout);
        jPanelFechasCabeceraLayout.setHorizontalGroup(
            jPanelFechasCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelFechasCabeceraLayout.createSequentialGroup()
                .addGap(12, 12, 12)
                .addComponent(PrimerDia, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addComponent(UltimoDia, javax.swing.GroupLayout.DEFAULT_SIZE, 93, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanelFechasCabeceraLayout.setVerticalGroup(
            jPanelFechasCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelFechasCabeceraLayout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(jPanelFechasCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(PrimerDia)
                    .addComponent(UltimoDia)))
        );

        javax.swing.GroupLayout jPanelCabeceraLayout = new javax.swing.GroupLayout(jPanelCabecera);
        jPanelCabecera.setLayout(jPanelCabeceraLayout);
        jPanelCabeceraLayout.setHorizontalGroup(
            jPanelCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCabeceraLayout.createSequentialGroup()
                .addGap(187, 187, 187)
                .addGroup(jPanelCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelCabeceraLayout.createSequentialGroup()
                        .addComponent(jPanelDatosCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanelFechasCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jPanelTituloCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(194, Short.MAX_VALUE))
        );
        jPanelCabeceraLayout.setVerticalGroup(
            jPanelCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCabeceraLayout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(jPanelTituloCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(jPanelCabeceraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelCabeceraLayout.createSequentialGroup()
                        .addGap(9, 9, 9)
                        .addComponent(jPanelDatosCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(26, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelCabeceraLayout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jPanelFechasCabecera, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(71, 71, 71))))
        );

        jPanel1.add(jPanelCabecera, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 30, 940, 210));

        jPanelFondoFactura.setBackground(new java.awt.Color(221, 223, 227));

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Clave", "Concepto", "Ingresos", "Descuentos"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTable2);
        if (jTable2.getColumnModel().getColumnCount() > 0) {
            jTable2.getColumnModel().getColumn(0).setPreferredWidth(70);
            jTable2.getColumnModel().getColumn(1).setPreferredWidth(300);
        }

        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/mas.png"))); // NOI18N
        jButton1.setText("Agregar Bonificación");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/mas.png"))); // NOI18N
        jButton2.setText("Agregar Descuento");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jPanel3.setBackground(new java.awt.Color(51, 153, 255));

        jPanel4Ingresos.setBackground(new java.awt.Color(51, 153, 255));

        Ingresos.setForeground(new java.awt.Color(255, 255, 255));
        Ingresos.setText("jLabel8");

        javax.swing.GroupLayout jPanel4IngresosLayout = new javax.swing.GroupLayout(jPanel4Ingresos);
        jPanel4Ingresos.setLayout(jPanel4IngresosLayout);
        jPanel4IngresosLayout.setHorizontalGroup(
            jPanel4IngresosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4IngresosLayout.createSequentialGroup()
                .addGap(46, 46, 46)
                .addComponent(Ingresos, javax.swing.GroupLayout.DEFAULT_SIZE, 44, Short.MAX_VALUE)
                .addGap(53, 53, 53))
        );
        jPanel4IngresosLayout.setVerticalGroup(
            jPanel4IngresosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4IngresosLayout.createSequentialGroup()
                .addComponent(Ingresos)
                .addGap(0, 6, Short.MAX_VALUE))
        );

        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("SUMAN:");

        Descuentos.setForeground(new java.awt.Color(255, 255, 255));
        Descuentos.setText("jLabel8");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap(67, Short.MAX_VALUE)
                .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(50, 50, 50)
                .addComponent(jPanel4Ingresos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Descuentos, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(37, 37, 37))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Descuentos)
                    .addComponent(jLabel6)
                    .addComponent(jPanel4Ingresos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jPanel4.setBackground(new java.awt.Color(51, 153, 255));

        jPanel4Ingresos1.setBackground(new java.awt.Color(51, 153, 255));

        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Depositado");

        javax.swing.GroupLayout jPanel4Ingresos1Layout = new javax.swing.GroupLayout(jPanel4Ingresos1);
        jPanel4Ingresos1.setLayout(jPanel4Ingresos1Layout);
        jPanel4Ingresos1Layout.setHorizontalGroup(
            jPanel4Ingresos1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Ingresos1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel8)
                .addContainerGap(64, Short.MAX_VALUE))
        );
        jPanel4Ingresos1Layout.setVerticalGroup(
            jPanel4Ingresos1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Ingresos1Layout.createSequentialGroup()
                .addComponent(jLabel8)
                .addGap(0, 6, Short.MAX_VALUE))
        );

        jPanel5.setBackground(new java.awt.Color(51, 153, 255));

        Total.setForeground(new java.awt.Color(255, 255, 255));
        Total.setText("jLabel8");

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(Total, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(40, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(Total)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(62, Short.MAX_VALUE)
                .addComponent(jPanel4Ingresos1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(89, 89, 89))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel4Ingresos1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jButtonGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/guardar-el-archivo (2).png"))); // NOI18N
        jButtonGuardar.setText("Guardar");
        jButtonGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonGuardarActionPerformed(evt);
            }
        });

        jButtonEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/menos.png"))); // NOI18N
        jButtonEliminar.setText("Eliminar");
        jButtonEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEliminarActionPerformed(evt);
            }
        });

        jButtonPagar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/simbolo-de-dolar.png"))); // NOI18N
        jButtonPagar.setText("Pagar Rol");
        jButtonPagar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonPagarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanelFondoFacturaLayout = new javax.swing.GroupLayout(jPanelFondoFactura);
        jPanelFondoFactura.setLayout(jPanelFondoFacturaLayout);
        jPanelFondoFacturaLayout.setHorizontalGroup(
            jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 172, Short.MAX_VALUE)))
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addComponent(jButtonPagar)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addComponent(jButtonGuardar)
                        .addGap(48, 48, 48)
                        .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 573, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButtonEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(61, Short.MAX_VALUE))
        );
        jPanelFondoFacturaLayout.setVerticalGroup(
            jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addGap(159, 159, 159)
                        .addComponent(jButton1)
                        .addGap(18, 18, 18)
                        .addComponent(jButton2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButtonPagar, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addGap(163, 163, 163)
                        .addComponent(jButtonEliminar)))
                .addGap(18, 18, 18)
                .addGroup(jPanelFondoFacturaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanelFondoFacturaLayout.createSequentialGroup()
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jButtonGuardar))
                .addContainerGap(19, Short.MAX_VALUE))
        );

        jPanel1.add(jPanelFondoFactura, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 240, 940, 520));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 936, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 764, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
    try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(
             "SELECT id_Bonificacion, bon_Descripcion, bon_Valor FROM Bonificaciones WHERE ESTADO_BON = 'ACT'");
         ResultSet rs = ps.executeQuery()) {

        JComboBox<String> comboBox = new JComboBox<>();
        while (rs.next()) {
            String id = rs.getString("id_Bonificacion");
            String descripcion = rs.getString("bon_Descripcion");
            double valor = rs.getDouble("bon_Valor");

            //Formatear los valores con un espaciado uniforme
            String formattedItem = String.format("%-10s %-30s %10.2f", id, descripcion, valor);
            comboBox.addItem(formattedItem);
        }

        int opcion = JOptionPane.showConfirmDialog(this, comboBox, "Seleccionar Bonificación", JOptionPane.OK_CANCEL_OPTION);
        if (opcion == JOptionPane.OK_OPTION) {
            String seleccion = (String) comboBox.getSelectedItem();
            String[] datos = seleccion.trim().split("\\s{2,}"); 
            String clave = datos[0];       
            String concepto = datos[1];    
            String ingreso = datos[2].replace(",", "."); //Reemplaza la coma con punto
            modeloTabla.addRow(new Object[]{clave, concepto, Double.parseDouble(ingreso), ""});
     
            
            actualizarTotales();
        }

    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar bonificaciones: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
     try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(
             "SELECT id_Descuento, des_Descripcion, des_Valor FROM Descuentos WHERE ESTADO_DES = 'ACT'");
         ResultSet rs = ps.executeQuery()) {

        JComboBox<String> comboBox = new JComboBox<>();
        while (rs.next()) {
            String id = rs.getString("id_Descuento");
            String descripcion = rs.getString("des_Descripcion");
            double valor = rs.getDouble("des_Valor");

            //Formatear los valores con un espaciado uniforme
            String formattedItem = String.format("%-10s %-30s %10.2f", id, descripcion, valor);
            comboBox.addItem(formattedItem);
        }

        int opcion = JOptionPane.showConfirmDialog(this, comboBox, "Seleccionar Descuento", JOptionPane.OK_CANCEL_OPTION);
        if (opcion == JOptionPane.OK_OPTION) {
            String seleccion = (String) comboBox.getSelectedItem();
            String[] datos = seleccion.trim().split("\\s{2,}"); 
            String clave = datos[0];      
            String concepto = datos[1];   
            String descuento = datos[2].replace(",", "."); //Reemplaza la coma con punto
            modeloTabla.addRow(new Object[]{clave, concepto, "", Double.parseDouble(descuento)});
            
            
            actualizarTotales();
        }

    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar descuentos: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButtonGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonGuardarActionPerformed
    Connection conexion = null;
    PreparedStatement psPagxEmp = null;
    PreparedStatement psBonificaciones = null;
    PreparedStatement psDescuentos = null;

    try {
        conexion = Conexion.conectar();
        conexion.setAutoCommit(false); //Iniciar la transacción

        String idPago = "2025-01"; 

        String cedulaEmpleado = Cedula.getText();
        String idEmpleado = obtenerIdEmpleado(cedulaEmpleado);

        double sueldo = 0.0;
        double totalBonificaciones = 0.0;
        double totalDescuentos = 0.0;

        //Recorrer la tabla y sumar valores
        for (int i = 0; i < modeloTabla.getRowCount(); i++) {
            String clave = (String) modeloTabla.getValueAt(i, 0);
            String concepto = (String) modeloTabla.getValueAt(i, 1);
            Object ingresosObj = modeloTabla.getValueAt(i, 2);
            Object descuentosObj = modeloTabla.getValueAt(i, 3);

            double ingresos = ingresosObj != null && !ingresosObj.toString().isEmpty() 
                            ? Double.parseDouble(ingresosObj.toString()) : 0.0;
            double descuentos = descuentosObj != null && !descuentosObj.toString().isEmpty() 
                            ? Double.parseDouble(descuentosObj.toString()) : 0.0;

            if (clave.equals("1000")) {
                sueldo = ingresos; //Asignar sueldo base
            } else if (clave.startsWith("B-")) { //Bonificaciones
                totalBonificaciones += ingresos;
                
                //Insertar o actualizar bonificación
                String sqlBonificacion = "INSERT INTO BonxEmpxPag (id_Bonificacion, id_Empleado, id_Pago, bxe_Fecha, bxe_Valor, ESTADO_BXE) " +
                                         "VALUES (?, ?, ?, CURRENT_DATE, ?, 'PEN') " +
                                         "ON CONFLICT (id_Bonificacion, id_Empleado, id_Pago) " +
                                         "DO UPDATE SET bxe_Valor = EXCLUDED.bxe_Valor, ESTADO_BXE = 'PEN'";
                psBonificaciones = conexion.prepareStatement(sqlBonificacion);
                psBonificaciones.setString(1, clave);
                psBonificaciones.setString(2, idEmpleado);
                psBonificaciones.setString(3, idPago);
                psBonificaciones.setDouble(4, ingresos);
                psBonificaciones.executeUpdate();
                
            } else if (clave.startsWith("D-")) { //Descuentos
                totalDescuentos += descuentos;
                
                //Insertar o actualizar descuento
                String sqlDescuento = "INSERT INTO DesxEmpxPag (id_Descuento, id_Empleado, id_Pago, dxe_Fecha, dxe_Valor, ESTADO_DXE) " +
                                      "VALUES (?, ?, ?, CURRENT_DATE, ?, 'PEN') " +
                                      "ON CONFLICT (id_Descuento, id_Empleado, id_Pago) " +
                                      "DO UPDATE SET dxe_Valor = EXCLUDED.dxe_Valor, ESTADO_DXE = 'PEN'";
                psDescuentos = conexion.prepareStatement(sqlDescuento);
                psDescuentos.setString(1, clave);
                psDescuentos.setString(2, idEmpleado);
                psDescuentos.setString(3, idPago);
                psDescuentos.setDouble(4, descuentos);
                psDescuentos.executeUpdate();
            }
        }

        //Calcular el valor neto
        double valorNeto = sueldo + totalBonificaciones - totalDescuentos;

        //Verificar si el registro ya existe en PagxEmp
        String sqlExiste = "SELECT COUNT(*) FROM PagxEmp WHERE id_Pago = ? AND id_Empleado = ?";
        try (PreparedStatement psExiste = conexion.prepareStatement(sqlExiste)) {
            psExiste.setString(1, idPago);
            psExiste.setString(2, idEmpleado);
            ResultSet rsExiste = psExiste.executeQuery();
            rsExiste.next();
            int count = rsExiste.getInt(1);

            if (count == 0) {
                //Insertar en PagxEmp solo si no existe
                String sqlPagxEmp = "INSERT INTO PagxEmp (id_Pago, id_Empleado, emp_Sueldo, emp_Bonificaciones, emp_Descuentos, emp_Valor_Neto, ESTADO_PxE) " +
                                    "VALUES (?, ?, ?, ?, ?, ?, 'PEN')";
                psPagxEmp = conexion.prepareStatement(sqlPagxEmp);
                psPagxEmp.setString(1, idPago);
                psPagxEmp.setString(2, idEmpleado);
                psPagxEmp.setDouble(3, sueldo);
                psPagxEmp.setDouble(4, totalBonificaciones);
                psPagxEmp.setDouble(5, totalDescuentos);
                psPagxEmp.setDouble(6, valorNeto);
                psPagxEmp.executeUpdate();
            } else {
                //Actualizar PagxEmp si ya existe
                String sqlUpdatePagxEmp = "UPDATE PagxEmp SET emp_Sueldo = ?, emp_Bonificaciones = ?, emp_Descuentos = ?, emp_Valor_Neto = ? " +
                                          "WHERE id_Pago = ? AND id_Empleado = ?";
                psPagxEmp = conexion.prepareStatement(sqlUpdatePagxEmp);
                psPagxEmp.setDouble(1, sueldo);
                psPagxEmp.setDouble(2, totalBonificaciones);
                psPagxEmp.setDouble(3, totalDescuentos);
                psPagxEmp.setDouble(4, valorNeto);
                psPagxEmp.setString(5, idPago);
                psPagxEmp.setString(6, idEmpleado);
                psPagxEmp.executeUpdate();
            }
        }

        //Confirmar transacción
        conexion.commit();
        JOptionPane.showMessageDialog(this, "Rol de pago guardado exitosamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
        this.dispose(); //Cerrar la ventana después de guardar

    } catch (Exception ex) {
        try {
            if (conexion != null) {
                conexion.rollback(); //Revertir cambios si hay error
            }
        } catch (SQLException rollbackEx) {
            rollbackEx.printStackTrace();
        }
        JOptionPane.showMessageDialog(this, "Error al guardar el rol de pago: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    } finally {
        try {
            if (psPagxEmp != null) psPagxEmp.close();
            if (psBonificaciones != null) psBonificaciones.close();
            if (psDescuentos != null) psDescuentos.close();
            if (conexion != null) conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    }//GEN-LAST:event_jButtonGuardarActionPerformed

    private void jButtonEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEliminarActionPerformed
        //Obtener la fila seleccionada
    int filaSeleccionada = jTable2.getSelectedRow();

    if (filaSeleccionada == -1) {
        JOptionPane.showMessageDialog(this, "Seleccione un elemento para eliminar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        return;
    }

    //Obtener la clave del elemento seleccionado
    String clave = (String) modeloTabla.getValueAt(filaSeleccionada, 0);
    String cedulaEmpleado = Cedula.getText();
    String idEmpleado = obtenerIdEmpleado(cedulaEmpleado);
    String idPago = Periodo.getText(); //Tomar el período como ID de pago

    //Confirmar eliminación
    int confirmacion = JOptionPane.showConfirmDialog(this, "¿Desea eliminar este registro del rol de pagos?", "Confirmación", JOptionPane.YES_NO_OPTION);
    if (confirmacion != JOptionPane.YES_OPTION) {
        return;
    }

    //Eliminar de la base de datos
    try (Connection conexion = Conexion.conectar()) {
        PreparedStatement ps = null;
        
        if (clave.startsWith("B-")) { //Si es una bonificación
            String sql = "DELETE FROM BonxEmpxPag WHERE id_Bonificacion = ? AND id_Empleado = ? AND id_Pago = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, clave);
            ps.setString(2, idEmpleado);
            ps.setString(3, idPago);
        } else if (clave.startsWith("D-")) { //Si es un descuento
            String sql = "DELETE FROM DesxEmpxPag WHERE id_Descuento = ? AND id_Empleado = ? AND id_Pago = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, clave);
            ps.setString(2, idEmpleado);
            ps.setString(3, idPago);
        } else {
            JOptionPane.showMessageDialog(this, "No se puede eliminar el sueldo base.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            return;
        }

        //Ejecutar eliminación
        int filasAfectadas = ps.executeUpdate();
        if (filasAfectadas > 0) {
            //Eliminar de la tabla en la interfaz
            modeloTabla.removeRow(filaSeleccionada);
            JOptionPane.showMessageDialog(this, "Registro eliminado correctamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
        } else {
            JOptionPane.showMessageDialog(this, "No se encontró el registro en la base de datos.", "Error", JOptionPane.ERROR_MESSAGE);
        }

        //Cerrar recursos
        if (ps != null) ps.close();
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(this, "Error al eliminar el registro: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }

    //Actualizar los totales después de la eliminación
    actualizarTotales();
    }//GEN-LAST:event_jButtonEliminarActionPerformed

    private void jButtonPagarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonPagarActionPerformed
    Connection conexion = null;
    PreparedStatement psPagxEmp = null;
    PreparedStatement psBonificaciones = null;
    PreparedStatement psDescuentos = null;

    try {
        conexion = Conexion.conectar();
        conexion.setAutoCommit(false); 

        String idPago = Periodo.getText(); 
        String cedulaEmpleado = Cedula.getText();
        String idEmpleado = obtenerIdEmpleado(cedulaEmpleado);

        String sqlPagxEmp = "UPDATE PagxEmp SET ESTADO_PxE = 'PAG' WHERE id_Pago = ? AND id_Empleado = ?";
        psPagxEmp = conexion.prepareStatement(sqlPagxEmp);
        psPagxEmp.setString(1, idPago);
        psPagxEmp.setString(2, idEmpleado);
        psPagxEmp.executeUpdate();

        String sqlBonificaciones = "UPDATE BonxEmpxPag SET ESTADO_BXE = 'PAG' WHERE id_Pago = ? AND id_Empleado = ?";
        psBonificaciones = conexion.prepareStatement(sqlBonificaciones);
        psBonificaciones.setString(1, idPago);
        psBonificaciones.setString(2, idEmpleado);
        psBonificaciones.executeUpdate();

        String sqlDescuentos = "UPDATE DesxEmpxPag SET ESTADO_DXE = 'PAG' WHERE id_Pago = ? AND id_Empleado = ?";
        psDescuentos = conexion.prepareStatement(sqlDescuentos);
        psDescuentos.setString(1, idPago);
        psDescuentos.setString(2, idEmpleado);
        psDescuentos.executeUpdate();

        conexion.commit();
        JOptionPane.showMessageDialog(this, "Rol de pago pagado correctamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
        this.dispose(); 

    } catch (Exception ex) {
        try {
            if (conexion != null) {
                conexion.rollback();
            }
        } catch (SQLException rollbackEx) {
            rollbackEx.printStackTrace();
        }
        JOptionPane.showMessageDialog(this, "Error al pagar el rol de pago: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    } finally {
        try {
            if (conexion != null) conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    }//GEN-LAST:event_jButtonPagarActionPerformed

 




    
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Cedula;
    private javax.swing.JLabel Dependencia;
    private javax.swing.JLabel Descuentos;
    private javax.swing.JLabel Ingresos;
    private javax.swing.JLabel Nombre;
    private javax.swing.JLabel Nomina;
    private javax.swing.JLabel Periodo;
    private javax.swing.JLabel PrimerDia;
    private javax.swing.JLabel Titulo;
    private javax.swing.JLabel Total;
    private javax.swing.JLabel UltimoDia;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButtonEliminar;
    private javax.swing.JButton jButtonGuardar;
    private javax.swing.JButton jButtonPagar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel4Ingresos;
    private javax.swing.JPanel jPanel4Ingresos1;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanelCabecera;
    private javax.swing.JPanel jPanelDatosCabecera;
    private javax.swing.JPanel jPanelFechasCabecera;
    private javax.swing.JPanel jPanelFondoFactura;
    private javax.swing.JPanel jPanelTituloCabecera;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable2;
    // End of variables declaration//GEN-END:variables
}
