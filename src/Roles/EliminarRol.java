 
package Roles;


import javax.swing.JOptionPane;
import java.sql.*;
import tthh.postgresql.Conexion;

/**
 *
 * @author JossueG
 */
public class EliminarRol extends javax.swing.JFrame {

    public EliminarRol() {
        initComponents();
        cargarEmpleados();
    }
    
   private void cargarEmpleados() {
    String sql = "SELECT DISTINCT e.id_Empleado, TRIM(e.emp_Apellido1) AS apellido, " +
                 "TRIM(e.emp_Nombre1) AS nombre, p.ESTADO_PxE " +
                 "FROM Empleados e " +
                 "JOIN PagxEmp p ON e.id_Empleado = p.id_Empleado " +
                 "ORDER BY e.id_Empleado ASC";  //Se ordena por ID de empleado ascendente

    try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        jComboBoxEmpleado.removeAllItems(); 

        while (rs.next()) {
            String idEmpleado = rs.getString("id_Empleado");
            String apellido = rs.getString("apellido");
            String nombre = rs.getString("nombre");
            String estado = rs.getString("ESTADO_PxE"); //Estado del rol

            //Convertimos el estado a un formato más descriptivo
            String estadoDescripcion;
            switch (estado) {
                case "PEN":
                    estadoDescripcion = "Pendiente";
                    break;
                case "PAG":
                    estadoDescripcion = "Pagado";
                    break;
                case "INA":
                    estadoDescripcion = "Inactivo";
                    break;
                default:
                    estadoDescripcion = "Desconocido";
            }
            
            jComboBoxEmpleado.addItem(idEmpleado + " - " + apellido + " " + nombre + " (" + estadoDescripcion + ")");
        }

    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar los roles de pago: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}





    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        PanelFondo = new javax.swing.JPanel();
        FondoIz = new javax.swing.JPanel();
        BarraAzul = new javax.swing.JPanel();
        PanelIz = new javax.swing.JPanel();
        titulo = new javax.swing.JLabel();
        Anular = new javax.swing.JButton();
        Cancelar = new javax.swing.JButton();
        jComboBoxEmpleado = new javax.swing.JComboBox<>();
        BarraBlanca = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Anular Rol");
        setLocationByPlatform(true);
        setResizable(false);

        PanelFondo.setBackground(new java.awt.Color(255, 255, 255));
        PanelFondo.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        FondoIz.setBackground(new java.awt.Color(0, 183, 186));

        BarraAzul.setBackground(new java.awt.Color(0, 183, 186));
        BarraAzul.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                BarraAzulMouseDragged(evt);
            }
        });
        BarraAzul.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                BarraAzulMousePressed(evt);
            }
        });

        javax.swing.GroupLayout BarraAzulLayout = new javax.swing.GroupLayout(BarraAzul);
        BarraAzul.setLayout(BarraAzulLayout);
        BarraAzulLayout.setHorizontalGroup(
            BarraAzulLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 380, Short.MAX_VALUE)
        );
        BarraAzulLayout.setVerticalGroup(
            BarraAzulLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 28, Short.MAX_VALUE)
        );

        PanelIz.setBackground(new java.awt.Color(255, 255, 255));

        titulo.setFont(new java.awt.Font("Leelawadee UI Semilight", 0, 24)); // NOI18N
        titulo.setText("ANULAR ROL DE PAGOS");

        Anular.setBackground(new java.awt.Color(0, 183, 186));
        Anular.setFont(new java.awt.Font("Microsoft YaHei UI", 1, 12)); // NOI18N
        Anular.setForeground(new java.awt.Color(255, 255, 255));
        Anular.setMnemonic('I');
        Anular.setText("Anular");
        Anular.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        Anular.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AnularActionPerformed(evt);
            }
        });

        Cancelar.setBackground(new java.awt.Color(0, 183, 186));
        Cancelar.setFont(new java.awt.Font("Microsoft YaHei UI", 1, 12)); // NOI18N
        Cancelar.setForeground(new java.awt.Color(255, 255, 255));
        Cancelar.setMnemonic('R');
        Cancelar.setText("CANCELAR");
        Cancelar.setBorderPainted(false);
        Cancelar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        Cancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CancelarActionPerformed(evt);
            }
        });

        jComboBoxEmpleado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBoxEmpleadoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout PanelIzLayout = new javax.swing.GroupLayout(PanelIz);
        PanelIz.setLayout(PanelIzLayout);
        PanelIzLayout.setHorizontalGroup(
            PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PanelIzLayout.createSequentialGroup()
                        .addComponent(titulo)
                        .addContainerGap(14, Short.MAX_VALUE))
                    .addGroup(PanelIzLayout.createSequentialGroup()
                        .addComponent(Anular)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(Cancelar)
                        .addGap(26, 26, 26))))
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(45, 45, 45)
                .addComponent(jComboBoxEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 199, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        PanelIzLayout.setVerticalGroup(
            PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(95, 95, 95)
                .addComponent(titulo)
                .addGap(40, 40, 40)
                .addComponent(jComboBoxEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(76, 76, 76)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Anular)
                    .addComponent(Cancelar))
                .addContainerGap(102, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout FondoIzLayout = new javax.swing.GroupLayout(FondoIz);
        FondoIz.setLayout(FondoIzLayout);
        FondoIzLayout.setHorizontalGroup(
            FondoIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(BarraAzul, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(FondoIzLayout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(PanelIz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        FondoIzLayout.setVerticalGroup(
            FondoIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(FondoIzLayout.createSequentialGroup()
                .addComponent(BarraAzul, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(PanelIz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 82, Short.MAX_VALUE))
        );

        PanelFondo.add(FondoIz, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 380, 530));

        BarraBlanca.setBackground(new java.awt.Color(255, 255, 255));
        BarraBlanca.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                BarraBlancaMouseDragged(evt);
            }
        });
        BarraBlanca.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                BarraBlancaMousePressed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Microsoft YaHei UI", 1, 12)); // NOI18N
        jLabel3.setText("  X");
        jLabel3.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel3MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout BarraBlancaLayout = new javax.swing.GroupLayout(BarraBlanca);
        BarraBlanca.setLayout(BarraBlancaLayout);
        BarraBlancaLayout.setHorizontalGroup(
            BarraBlancaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, BarraBlancaLayout.createSequentialGroup()
                .addGap(0, 315, Short.MAX_VALUE)
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        BarraBlancaLayout.setVerticalGroup(
            BarraBlancaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(BarraBlancaLayout.createSequentialGroup()
                .addComponent(jLabel3)
                .addGap(0, 13, Short.MAX_VALUE))
        );

        PanelFondo.add(BarraBlanca, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 0, 340, 30));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelFondo, javax.swing.GroupLayout.PREFERRED_SIZE, 384, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelFondo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void CancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CancelarActionPerformed

    }//GEN-LAST:event_CancelarActionPerformed

    private void jLabel3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel3MouseClicked

    }//GEN-LAST:event_jLabel3MouseClicked

    private void BarraAzulMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BarraAzulMouseDragged

    }//GEN-LAST:event_BarraAzulMouseDragged

    private void BarraBlancaMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BarraBlancaMouseDragged

    }//GEN-LAST:event_BarraBlancaMouseDragged

    private void BarraAzulMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BarraAzulMousePressed

    }//GEN-LAST:event_BarraAzulMousePressed

    private void BarraBlancaMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_BarraBlancaMousePressed

    }//GEN-LAST:event_BarraBlancaMousePressed

    private void AnularActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AnularActionPerformed
    String empleadoSeleccionado = (String) jComboBoxEmpleado.getSelectedItem();

    if (empleadoSeleccionado == null || empleadoSeleccionado.isEmpty()) {
        JOptionPane.showMessageDialog(this, "Seleccione un empleado para anular su rol de pago.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        return;
    }

    //Extraer el ID del empleado 
    String idEmpleado = empleadoSeleccionado.split(" - ")[0].trim();

    //Confirmar anulación
    int confirmacion = JOptionPane.showConfirmDialog(this,
        "¿Está seguro de que desea anular el rol de pago de este empleado?",
        "Confirmar Anulación",
        JOptionPane.YES_NO_OPTION);

    if (confirmacion != JOptionPane.YES_OPTION) {
        return;
    }

    Connection conexion = null;
    PreparedStatement psPagxEmp = null;
    PreparedStatement psBonificaciones = null;
    PreparedStatement psDescuentos = null;

    try {
        conexion = Conexion.conectar();
        conexion.setAutoCommit(false); //Iniciar transacción

        String idPago = null;
        String sqlObtenerPago = "SELECT id_Pago FROM PagxEmp WHERE id_Empleado = ? AND ESTADO_PxE IN ('PEN', 'PAG') ORDER BY id_Pago DESC LIMIT 1";
        
        try (PreparedStatement psObtenerPago = conexion.prepareStatement(sqlObtenerPago)) {
            psObtenerPago.setString(1, idEmpleado);
            ResultSet rs = psObtenerPago.executeQuery();
            if (rs.next()) {
                idPago = rs.getString("id_Pago");
            } else {
                JOptionPane.showMessageDialog(this, "No se encontró un rol de pago pendiente o pagado para este empleado.", "Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
        }

        //Anular el rol de pago
        String sqlAnularPagxEmp = "UPDATE PagxEmp SET ESTADO_PxE = 'INA' WHERE id_Pago = ? AND id_Empleado = ?";
        psPagxEmp = conexion.prepareStatement(sqlAnularPagxEmp);
        psPagxEmp.setString(1, idPago);
        psPagxEmp.setString(2, idEmpleado);
        psPagxEmp.executeUpdate();

        //Anular bonificaciones
        String sqlAnularBonificaciones = "UPDATE BonxEmpxPag SET ESTADO_BXE = 'INA' WHERE id_Pago = ? AND id_Empleado = ?";
        psBonificaciones = conexion.prepareStatement(sqlAnularBonificaciones);
        psBonificaciones.setString(1, idPago);
        psBonificaciones.setString(2, idEmpleado);
        psBonificaciones.executeUpdate();

        //Anular descuentos
        String sqlAnularDescuentos = "UPDATE DesxEmpxPag SET ESTADO_DXE = 'INA' WHERE id_Pago = ? AND id_Empleado = ?";
        psDescuentos = conexion.prepareStatement(sqlAnularDescuentos);
        psDescuentos.setString(1, idPago);
        psDescuentos.setString(2, idEmpleado);
        psDescuentos.executeUpdate();

        //Confirmar transacción
        conexion.commit();
        JOptionPane.showMessageDialog(this, "Rol de pago anulado exitosamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);

    } catch (SQLException ex) {
        try {
            if (conexion != null) {
                conexion.rollback(); //Revertir cambios si hay error
            }
        } catch (SQLException rollbackEx) {
            rollbackEx.printStackTrace();
        }
        JOptionPane.showMessageDialog(this, "Error al anular el rol de pago: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
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
    
    //Actualizar ComboBox después de anular el rol de pago
    cargarEmpleados();
    }//GEN-LAST:event_AnularActionPerformed

    private void jComboBoxEmpleadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBoxEmpleadoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBoxEmpleadoActionPerformed






    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(EliminarRol.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(EliminarRol.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(EliminarRol.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(EliminarRol.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new EliminarRol().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Anular;
    private javax.swing.JPanel BarraAzul;
    private javax.swing.JPanel BarraBlanca;
    private javax.swing.JButton Cancelar;
    private javax.swing.JPanel FondoIz;
    private javax.swing.JPanel PanelFondo;
    private javax.swing.JPanel PanelIz;
    private javax.swing.JComboBox<String> jComboBoxEmpleado;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel titulo;
    // End of variables declaration//GEN-END:variables
}
