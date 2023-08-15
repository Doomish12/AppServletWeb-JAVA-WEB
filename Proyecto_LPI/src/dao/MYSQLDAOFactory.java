package dao;

import interfaces.LoginInterfarce;
import mante.LoginModelo;

public class MYSQLDAOFactory extends DAOFactory {

	@Override
	public LoginInterfarce getEmpleado(){
		return new LoginModelo();
	}

}
