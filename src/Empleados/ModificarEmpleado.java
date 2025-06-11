
package Empleados;


import javax.swing.JOptionPane;
import java.sql.*;
import tthh.postgresql.Conexion;

/**
 *
 * @author JossueG
 */
public class ModificarEmpleado extends javax.swing.JFrame {

    public ModificarEmpleado() {
        initComponents();
        cargarEmpleados();
    }
    
    private void cargarEmpleados() {
    String sql = "SELECT id_Empleado, TRIM(emp_Apellido1) AS apellido, TRIM(emp_Nombre1) AS nombre " +
                 "FROM Empleados  ORDER BY id_Empleado ASC";

    try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        jComboBoxEmpleado.removeAllItems(); //Limpiar el JComboBox

        while (rs.next()) {
            String idEmpleado = rs.getString("id_Empleado");
            String apellido = rs.getString("apellido"); 
            String nombre = rs.getString("nombre");     

            jComboBoxEmpleado.addItem(idEmpleado + " - " + apellido + " " + nombre);
        }

    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al cargar los empleados: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
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
        Buscar = new javax.swing.JButton();
        Cancelar = new javax.swing.JButton();
        jComboBoxEmpleado = new javax.swing.JComboBox<>();
        BarraBlanca = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Modificar Empleado");
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
        titulo.setText("MODIFICAR EMPLEADO");

        Buscar.setBackground(new java.awt.Color(0, 183, 186));
        Buscar.setFont(new java.awt.Font("Microsoft YaHei UI", 1, 12)); // NOI18N
        Buscar.setForeground(new java.awt.Color(255, 255, 255));
        Buscar.setMnemonic('I');
        Buscar.setText("BUSCAR");
        Buscar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        Buscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BuscarActionPerformed(evt);
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

        javax.swing.GroupLayout PanelIzLayout = new javax.swing.GroupLayout(PanelIz);
        PanelIz.setLayout(PanelIzLayout);
        PanelIzLayout.setHorizontalGroup(
            PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(PanelIzLayout.createSequentialGroup()
                        .addComponent(Buscar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(Cancelar))
                    .addComponent(jComboBoxEmpleado, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(titulo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(23, Short.MAX_VALUE))
        );
        PanelIzLayout.setVerticalGroup(
            PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(85, 85, 85)
                .addComponent(titulo)
                .addGap(57, 57, 57)
                .addComponent(jComboBoxEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(69, 69, 69)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Buscar)
                    .addComponent(Cancelar))
                .addContainerGap(70, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout FondoIzLayout = new javax.swing.GroupLayout(FondoIz);
        FondoIz.setLayout(FondoIzLayout);
        FondoIzLayout.setHorizontalGroup(
            FondoIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(BarraAzul, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(FondoIzLayout.createSequentialGroup()
                .addGap(37, 37, 37)
                .addComponent(PanelIz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        FondoIzLayout.setVerticalGroup(
            FondoIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(FondoIzLayout.createSequentialGroup()
                .addComponent(BarraAzul, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(PanelIz, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 114, Short.MAX_VALUE))
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

    private void BuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BuscarActionPerformed
    String empleadoSeleccionado = (String) jComboBoxEmpleado.getSelectedItem();

    if (empleadoSeleccionado == null || empleadoSeleccionado.isEmpty()) {
        JOptionPane.showMessageDialog(this, "Seleccione un empleado para modificar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        return;
    }

    //Extraer el ID del empleado seleccionado
    String idEmpleado = empleadoSeleccionado.split(" - ")[0].trim();

    try {
        //Abrir el segundo JFrame y pasar el ID del empleado seleccionado
        ModificarEmpleado2 modificarEmpleado2 = new ModificarEmpleado2(idEmpleado);
        modificarEmpleado2.setVisible(true);
        this.dispose();
    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error al abrir el formulario de modificación: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
    }//GEN-LAST:event_BuscarActionPerformed






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
            java.util.logging.Logger.getLogger(ModificarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ModificarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ModificarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ModificarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
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
                new ModificarEmpleado().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel BarraAzul;
    private javax.swing.JPanel BarraBlanca;
    private javax.swing.JButton Buscar;
    private javax.swing.JButton Cancelar;
    private javax.swing.JPanel FondoIz;
    private javax.swing.JPanel PanelFondo;
    private javax.swing.JPanel PanelIz;
    private javax.swing.JComboBox<String> jComboBoxEmpleado;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel titulo;
    // End of variables declaration//GEN-END:variables
}
