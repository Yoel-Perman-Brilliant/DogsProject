package db;
import java.sql.*;

public class ForDataBase {

private Connection con;
	    /**
          * constructor - create object con ( Connection type) 
          * invoking from the line: <jsp:useBean id="db" class = "jdbc.ForDataBase"/>
          */
          
	@SuppressWarnings("deprecation")
	public ForDataBase() throws Exception {
		try {
			           //we want use MySQL Connector
              Class.forName("com.mysql.cj.jdbc.Driver").newInstance();	
			

                        //The URL of the database : jdbc:mysql://127.0.0.1:3306/dugma
                        // jdbc:mysql - protocol
                        // 127.0.0.1 - IP	
                        // 3306 - port number
                        // dugma - database name
                       //name of default user of MySQLServer: -root
                       //root password: 1234
              con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dogs?user=root&password=1234");		}

		catch (Exception e) {
			throw e;
		} 
	}
         /**
          * This function performs one direction SQL commands and returns
          * the number of updated rows
          */

	public int insertUpdateDelete(String sql){
		int num=0;
		try{
                 // Create object st (Statement type) - help object for con
			Statement st = con.createStatement();
                 // Invoke sql command
			num=st.executeUpdate(sql);
			st.close();
		} catch (SQLException e){
			e.printStackTrace();
		}	
		return num;
	}

        /**
          * This function performs Select SQL commands
          * and returns the result array of the data
          */
	
	public String [][] select(String sql){
		String result [][]=null;
		try{
			// Create object st (Statement type) - help object for con
                        Statement st = con.createStatement(
	                          ResultSet.TYPE_SCROLL_INSENSITIVE,
	                          ResultSet.CONCUR_UPDATABLE
                        );
                        // Invoke sql command and puts the result into ResultSet object - res
			ResultSet res = st.executeQuery(sql);
                        // m- the column number
			int m=res.getMetaData().getColumnCount();
                        // move the cursor to the last row
			res.last();
                        // n- the number of the last row
			int n=res.getRow();
                        // create the array
			result=new String[n][m];
                        // move the cursor before the first line
			res.beforeFirst();
                        // copy the data from resultset to the array
			int i=0;
			while (res.next())
			{

				for(int j=0;j<m;j++)
				    result[i][j]=res.getString(j+1);
				i++;
			}
			res.close();
			st.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return result;
	}


}
