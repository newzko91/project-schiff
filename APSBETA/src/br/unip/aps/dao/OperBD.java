package br.unip.aps.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.unip.aps.models.ContaUsuario;
import br.unip.aps.models.Pessoa;

public class OperBD {

	 
    public static ContaUsuario findUser(Connection conn, String login, String senha) throws SQLException {
 
        String sql = "SELECT USR.matricula,p.nome, USR.login,USR.senha,PERMISSAO.descricao\n" + 
        		"FROM CONTA_USUARIO AS USR\n" + 
        		"INNER JOIN  TIPO_USUARIO AS PERMISSAO ON (USR.tipoacesso = PERMISSAO.tipo)\n" + 
        		"INNER JOIN PESSOA AS p ON (USR.matricula = p.matricula) WHERE USR.login = ? AND USR.senha = ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        pstm.setString(2, senha);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            int matricula = rs.getInt("matricula");
            String nome = rs.getString("nome");
            String desc = rs.getString("descricao");
            ContaUsuario user = new ContaUsuario();
            user.setMatricula(matricula);
            user.setNome(nome);
            user.setLogin(login);
            user.setSenha(senha);
            user.setTipoacesso(desc);
            return user;
        }
        return null;
    }
 
    public static ContaUsuario findUser(Connection conn, String login) throws SQLException {
 
        String sql = "SELECT USR.matricula,p.nome, USR.login,USR.senha,PERMISSAO.descricao\n" + 
        		"FROM CONTA_USUARIO AS USR\n" + 
        		"INNER JOIN  TIPO_USUARIO AS PERMISSAO ON (USR.tipoacesso = PERMISSAO.tipo)\n" + 
        		"INNER JOIN PESSOA AS p ON (USR.matricula = p.matricula) WHERE USR.login = ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
 
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
        	   	int matricula = rs.getInt("matricula");
            String nome = rs.getString("nome");
            String senha = rs.getString("senha");
            String desc = rs.getString("descricao");
            ContaUsuario user = new ContaUsuario();
            user.setMatricula(matricula);
            user.setNome(nome);
            user.setLogin(login);
            user.setSenha(senha);
            user.setTipoacesso(desc);
            return user;
        }
        return null;
    }
 
   
   public static ContaUsuario findUserAdmin(Connection conn, String matricula) throws SQLException {
       String sql = "SELECT USR.matricula,p.nome,USR.login,USR.senha,USR.tipoacesso FROM CONTA_USUARIO USR\n" + 
       		"INNER JOIN PESSOA AS p ON (USR.matricula = p.matricula)\n" + 
       		"WHERE USR.matricula=?";

       PreparedStatement pstm = conn.prepareStatement(sql);
       pstm.setString(1, matricula);

       ResultSet rs = pstm.executeQuery();

       while (rs.next()) {
    	   		int matriculav = Integer.parseInt(matricula);
    	   		String nome = rs.getString("nome");
    	   		String login = rs.getString("login");
    	   		String senha = rs.getString("senha");
    	   		String tipoacesso = rs.getString("tipoacesso");
           
           ContaUsuario user = new ContaUsuario (matriculav,nome,login,senha,tipoacesso);
           
           return user;
       }
       return null;
   }
   
   public static Pessoa findPessoa(Connection conn, String matricula) throws SQLException {
       String sql = "SELECT p.matricula,p.nome,p.endereco,p.telefone,p.email,p.rg,p.cpf_cnpj,s.descricao AS status,pt.descricao AS tipopessoa, emp.tipo_emp AS tipoRH,dep.departamento as Departamento,c.cargo as Cargo\n" + 
       		"FROM PESSOA AS p\n" + 
       		"INNER JOIN  STATUS AS s ON (p.status = s.tipo)\n" + 
       		"INNER JOIN TIPO_PESSOA AS pt ON (p.tipo = pt.tipo)\n" + 
       		"INNER JOIN TIPO_EMP as emp ON (p.tipo_emp = emp.id)\n" + 
       		"INNER JOIN DEPARTAMENTO as dep ON (p.depto = dep.id)\n" + 
       		"INNER JOIN CARGO as c ON (p.cargo = c.id)\n" + 
       		"WHERE p.matricula =?";

       PreparedStatement pstm = conn.prepareStatement(sql);
       pstm.setString(1, matricula);

       ResultSet rs = pstm.executeQuery();

    	   while (rs.next()) {
   	   		int matriculav = Integer.parseInt(matricula);
   	   		String nome = rs.getString("nome");
       		String endereco = rs.getString("endereco");
       		String telefone = rs.getString("telefone");
       		String email = rs.getString("email");
       		String rg = rs.getString("rg");
       		String cpf_cnpj = rs.getString("cpf_cnpj");
       		String status = rs.getString("status");
       		String tipo = rs.getString("tipopessoa");
       		String tipo_emp = rs.getString("tipoRH");
       		String depto = rs.getString("Departamento");
       		String cargo = rs.getString("Cargo");
          
          //Pessoa p = new Pessoa (matriculav,nome,endereco,telefone,email,rg,cpf_cnpj,status,tipo,tipo_emp,tipo_emp,depto,cargo);
          
        Pessoa p = new Pessoa(matriculav, nome, endereco,  telefone,  email, rg,
    			 cpf_cnpj,  status,  tipo,  tipo_emp,  depto,  cargo);
       		
        			return p;
           }
           return null;
       }
   
   public static void updateUser(Connection conn, ContaUsuario user) throws SQLException {
       String sql = "UPDATE CONTA_USUARIO SET login=?, senha=?, tipoacesso=? WHERE matricula=? ";

       PreparedStatement pstm = conn.prepareStatement(sql);

       pstm.setString(1, user.getLogin());
       pstm.setString(2, user.getSenha());
       pstm.setString(3, user.getTipoacesso());
       pstm.setInt(4, user.getMatricula());
       pstm.executeUpdate();
   }
   
   public static void updatePessoa(Connection conn, Pessoa p) throws SQLException {
       String sql = "UPDATE PESSOA SET nome=?, endereco=?, telefone=?, email=?, rg=?, cpf_cnpj=?, status=?, tipo=?, "
       		+ "tipo_emp=?, depto=?, cargo=? WHERE matricula=? ";

       PreparedStatement pstm = conn.prepareStatement(sql);
       
       pstm.setString(1, p.getNome());
       pstm.setString(2, p.getEndereco());
       pstm.setString(3, p.getTelefone());
       pstm.setString(4, p.getEmail());
       pstm.setString(5, p.getRg());
       pstm.setString(6, p.getCpf_cnpj());
       pstm.setString(7, p.getStatus());
       pstm.setString(8, p.getTipo());
       pstm.setString(9, p.getTipo_emp());
       pstm.setString(10, p.getDepto());
       pstm.setString(11, p.getCargo());
       pstm.setInt(12, p.getMatricula());
     
       pstm.executeUpdate();
   }
  
   public static void insertUser(Connection conn, ContaUsuario user) throws SQLException {
       String sql = "INSERT INTO CONTA_USUARIO(matricula, login, senha, tipoacesso)\n" + 
       		"VALUES (?,?,?,?)";

       PreparedStatement pstm = conn.prepareStatement(sql);
       
       pstm.setInt(1, user.getMatricula());
       pstm.setString(2, user.getLogin());
       pstm.setString(3, user.getSenha());
       pstm.setString(4, user.getTipoacesso());

       pstm.executeUpdate();
   }
   
   public static void insertPessoa(Connection conn, Pessoa p) throws SQLException {
       String sql = "INSERT INTO PESSOA(matricula, nome, endereco, telefone, email, rg, cpf_cnpj, status, tipo, tipo_emp, depto, cargo)\n" + 
       		"VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

       PreparedStatement pstm = conn.prepareStatement(sql);
       
       pstm.setInt(1, p.getMatricula());
       pstm.setString(2, p.getNome());
       pstm.setString(3, p.getEndereco());
       pstm.setString(4, p.getTelefone());
       pstm.setString(5, p.getEmail());
       pstm.setString(6, p.getRg());
       pstm.setString(7, p.getCpf_cnpj());
       pstm.setString(8, p.getStatus());
       pstm.setString(9, p.getTipo());
       pstm.setString(10, p.getTipo_emp());
       pstm.setString(11, p.getDepto());
       pstm.setString(12, p.getCargo());
       

       pstm.executeUpdate();
   }
   
   public static void deleteUser(Connection conn, String matriculaStr) throws SQLException {
       String sql = "DELETE FROM PESSOA WHERE matricula=?";

       PreparedStatement pstm = conn.prepareStatement(sql);
       
       pstm.setString(1, matriculaStr);

       pstm.executeUpdate();
   }
   
   public static void deletePessoa(Connection conn, String matriculaStr) throws SQLException {
       String sql = "DELETE FROM PESSOA WHERE matricula= ?";

       PreparedStatement pstm = conn.prepareStatement(sql);
       
       pstm.setString(1, matriculaStr);

       pstm.executeUpdate();
   }
   
   public static List<ContaUsuario> queryUsers(Connection conn) throws SQLException {
       String sql = "SELECT USR.matricula,p.nome, USR.login,USR.senha,PERMISSAO.descricao\n" + 
       		"FROM CONTA_USUARIO AS USR\n" + 
       		"INNER JOIN  TIPO_USUARIO AS PERMISSAO ON (USR.tipoacesso = PERMISSAO.tipo)\n" + 
       		"INNER JOIN PESSOA AS p ON (USR.matricula = p.matricula)";

       PreparedStatement pstm = conn.prepareStatement(sql);

       ResultSet rs = pstm.executeQuery();
       List<ContaUsuario> list = new ArrayList<ContaUsuario>();
       while (rs.next()) {
       		int matricula = rs.getInt("matricula");
       		String nome = rs.getString("nome");
       		String login = rs.getString("login");
       		String senha = rs.getString("senha");
           String  tipoacesso = rs.getString("descricao");
       		
           ContaUsuario user = new ContaUsuario();
           
           user.setMatricula(matricula);
           user.setNome(nome);
           user.setLogin(login);
           user.setSenha(senha);
           user.setTipoacesso(tipoacesso);
           list.add(user);
       }
       return list;
   }
   
   public static List<Pessoa> queryPessoa(Connection conn) throws SQLException {
      String sql = "SELECT p.matricula,p.nome,p.endereco,p.telefone,p.email,p.rg,p.cpf_cnpj,s.descricao AS status,pt.descricao AS tipopessoa, emp.tipo_emp AS tipoRH,dep.departamento as Departamento,c.cargo as Cargo\n" + 
       		"FROM PESSOA AS p\n" + 
       		"INNER JOIN  STATUS AS s ON (p.status = s.tipo)\n" + 
       		"INNER JOIN TIPO_PESSOA AS pt ON (p.tipo = pt.tipo)\n" + 
       		"INNER JOIN TIPO_EMP as emp ON (p.tipo_emp = emp.id)\n" + 
       		"INNER JOIN DEPARTAMENTO as dep ON (p.depto = dep.id)\n" + 
       		"INNER JOIN CARGO as c ON (p.cargo = c.id)";
	   
	   

       PreparedStatement pstm = conn.prepareStatement(sql);

       ResultSet rs = pstm.executeQuery();
       List<Pessoa> list = new ArrayList<Pessoa>();
       
       while (rs.next()) {
    	   
    	   	int matricula = rs.getInt("matricula");
    		String nome = rs.getString("nome");
    		String endereco = rs.getString("endereco");
    		String telefone = rs.getString("telefone");
    		String email = rs.getString("email");
    		String rg = rs.getString("rg");
    		String cpf_cnpj = rs.getString("cpf_cnpj");
    		String status = rs.getString("status");
    		String tipo = rs.getString("tipopessoa");
    		String tipo_emp = rs.getString("tipoRH");
    		String depto = rs.getString("Departamento");
    		String cargo = rs.getString("Cargo");
       		
           Pessoa p = new Pessoa();
           
           p.setMatricula(matricula);
           p.setNome(nome);
           p.setEndereco(endereco);
           p.setTelefone(telefone);
           p.setEmail(email);
           p.setRg(rg);
           p.setCpf_cnpj(cpf_cnpj);
           p.setStatus(status);
           p.setTipo(tipo);
           p.setTipo_emp(tipo_emp);
           p.setDepto(depto);
           p.setCargo(cargo);
           list.add(p);
       }
       return list;
   }
  
}
