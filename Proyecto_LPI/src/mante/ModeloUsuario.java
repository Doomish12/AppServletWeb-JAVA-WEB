package mante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import modelos.login;
import utils.Conexion;

public class ModeloUsuario {
	public login iniciarSesion(String usuario, String contraseña) {
		login login = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			cn = Conexion.getConexion();
			String sql = "SELECT U.idUsuario, U.usuario, U.contraseña FROM users U WHERE U.usuario = ? AND U.contraseña = ? ";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, usuario);
			pstm.setString(2, contraseña);
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				login = new login();
				login.setIdUsuario(rs.getInt("idUsuario"));
				login.setUsuario(rs.getString("usuario"));
				login.setContraseña(rs.getString("contraseña"));
	
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
		
		return login;
	}
}
