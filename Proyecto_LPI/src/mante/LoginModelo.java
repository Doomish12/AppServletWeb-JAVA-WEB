package mante;

import java.sql.Connection;
import java.sql.PreparedStatement;

import interfaces.LoginInterfarce;
import modelos.login;
import utils.LoginMysqlConexion;

public class LoginModelo implements LoginInterfarce{
	@Override
	public int crearLogin(login login) {
		int value = 0;
		Connection cn = null;
		PreparedStatement psm = null;
		try {
			cn = LoginMysqlConexion.getConexion();
			String sql = "INSERT INTO users VALUES(null, ?, ?, ?, ?, ?)";
			psm = cn.prepareStatement(sql);
			psm.setString(1,login.getNombre());
			psm.setString(2,login.getApellidos());
			psm.setString(3,login.getCorreo());
			psm.setString(4,login.getUsuario());
			psm.setString(5,login.getContraseña());
			value = psm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(psm != null) psm.close();
				if(cn != null) cn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return value;
	}
}
