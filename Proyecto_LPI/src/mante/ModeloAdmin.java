package mante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.Conexion;
import modelos.admin;

public class ModeloAdmin {	
	
	public admin iniciarSesion(String usuario, String contraseña) {
		admin admin = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			cn = Conexion.getConexion();
			String sql = "SELECT U.idAdmin, U.usuario, U.contraseña FROM administrador U WHERE U.usuario = ? AND U.contraseña = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, usuario);
			pstm.setString(2, contraseña);
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				admin = new admin();
				admin.setIdAdmin(rs.getInt("idAdmin"));
				admin.setUsuario(rs.getString("usuario"));
				admin.setContraseña(rs.getString("contraseña"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (pstm != null) {
					pstm.close();
				}
				
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return admin;
	}


}