
package Empleados;


import javax.swing.JOptionPane;
import java.sql.*;
import tthh.postgresql.Conexion;

/**
 *
 * @author JossueG
 */
public class EliminarEmpleado extends javax.swing.JFrame {

    public EliminarEmpleado() {
        initComponents();
        cargarEmpleados();
    }
    
    private void cargarEmpleados() {
     String sql = "SELECT id_Empleado, TRIM(emp_Apellido1) AS apellido, TRIM(emp_Nombre1) AS nombre " +
                 "FROM Empleados WHERE ESTADO_EMP = 'ACT' ORDER BY id_Empleado ASC";

    try (Connection conexion = Conexion.conectar();
         PreparedStatement ps = conexion.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        jComboBoxEmpleado.removeAllItems(); 

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
        Eliminar = new javax.swing.JButton();
        Cancelar = new javax.swing.JButton();
        jComboBoxEmpleado = new javax.swing.JComboBox<>();
        BarraBlanca = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Eliminar Empleado");
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
        titulo.setText("ELIMINAR EMPLEADO");

        Eliminar.setBackground(new java.awt.Color(0, 183, 186));
        Eliminar.setFont(new java.awt.Font("Microsoft YaHei UI", 1, 12)); // NOI18N
        Eliminar.setForeground(new java.awt.Color(255, 255, 255));
        Eliminar.setMnemonic('I');
        Eliminar.setText("ELIMINAR");
        Eliminar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        Eliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EliminarActionPerformed(evt);
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
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PanelIzLayout.createSequentialGroup()
                .addContainerGap(17, Short.MAX_VALUE)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(titulo, javax.swing.GroupLayout.PREFERRED_SIZE, 258, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(PanelIzLayout.createSequentialGroup()
                            .addComponent(Eliminar)
                            .addGap(71, 71, 71)
                            .addComponent(Cancelar))
                        .addComponent(jComboBoxEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(15, 15, 15))
        );
        PanelIzLayout.setVerticalGroup(
            PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelIzLayout.createSequentialGroup()
                .addGap(84, 84, 84)
                .addComponent(titulo, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(33, 33, 33)
                .addComponent(jComboBoxEmpleado, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(63, 63, 63)
                .addGroup(PanelIzLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Eliminar)
                    .addComponent(Cancelar))
                .addContainerGap(84, Short.MAX_VALUE))
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
    this.dispose(); 
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

    private void EliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EliminarActionPerformed
     String empleadoSeleccionado = (String) jComboBoxEmpleado.getSelectedItem();

    if (empleadoSeleccionado == null) {
        JOptionPane.showMessageDialog(this, "Seleccione un empleado para marcar como inactivo.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        return;
    }

    // Extraer el ID del empleado
    String idEmpleado = empleadoSeleccionado.split(" - ")[0];

    int confirmacion = JOptionPane.showConfirmDialog(this, "¿Está seguro de marcar como inactivo al empleado: " + empleadoSeleccionado + "?",
                                                     "Confirmar Acción", JOptionPane.YES_NO_OPTION);

    if (confirmacion == JOptionPane.YES_OPTION) {
        //Actualiza el estado y asigna la fecha/hora actual 
        String sql = "UPDATE Empleados SET ESTADO_EMP = 'INA', emp_FechaBaja = CURRENT_TIMESTAMP WHERE id_Empleado = ?";

        try (Connection conexion = Conexion.conectar();
             PreparedStatement ps = conexion.prepareStatement(sql)) {

            ps.setString(1, idEmpleado);

            int resultado = ps.executeUpdate();

            if (resultado > 0) {
                JOptionPane.showMessageDialog(this, "El empleado ha sido marcado como inactivo y se registró la fecha y hora de baja.");
                cargarEmpleados(); //Actualizar el JComboBox después del cambio
            } else {
                JOptionPane.showMessageDialog(this, "No se pudo actualizar el estado del empleado.", "Error", JOptionPane.ERROR_MESSAGE);
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error al actualizar el estado del empleado: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    }//GEN-LAST:event_EliminarActionPerformed

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
            java.util.logging.Logger.getLogger(EliminarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(EliminarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(EliminarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(EliminarEmpleado.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new EliminarEmpleado().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel BarraAzul;
    private javax.swing.JPanel BarraBlanca;
    private javax.swing.JButton Cancelar;
    private javax.swing.JButton Eliminar;
    private javax.swing.JPanel FondoIz;
    private javax.swing.JPanel PanelFondo;
    private javax.swing.JPanel PanelIz;
    private javax.swing.JComboBox<String> jComboBoxEmpleado;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel titulo;
    // End of variables declaration//GEN-END:variables
}
