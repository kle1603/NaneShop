/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class AdminDAO {
    
    public boolean createProduct(String productName, int productTypeId, int quantity, double price, String productImageUrl) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement("INSERT INTO products (product_name, category_id, quantity, price, imageURL) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, productName);
                ps.setInt(2, productTypeId);
                ps.setInt(3, quantity);
                ps.setDouble(4, price);
                ps.setString(5, productImageUrl);
                check = ps.executeUpdate() > 0;


            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
    
    public boolean updateProductByAdmin(int productId, String productName, int productTypeId, int quantity, double price) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement("UPDATE products SET category_id = ?, quantity = ?, price = ?, product_name = ? WHERE product_id = ?");
                ps.setInt(1, productTypeId);
                ps.setInt(2, quantity);
                ps.setDouble(3, price);
                ps.setString(4, productName);
                ps.setInt(5, productId);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }

    public boolean deleteBreadByAdmin(int parseInt) {
        boolean check = false;
        return check;
    }
}
