using MISA.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MISA.DL
{
    public class DbContext : IDisposable//implement IDisposable de duoc dung using
    {
        SqlConnection sqlConection;
        SqlCommand sqlCommand;
        public DbContext()
        {
            string connectionString ="Server=DESKTOP-VU8N3T5;Database=MISA-MSK;Trusted_Connection=True";

            //khoi tao doi tuong conection
            sqlConection = new SqlConnection(connectionString);

            //Doi tuong Sql Commeand:cho phep thao tac voi csdl
            sqlCommand = sqlConection.CreateCommand();
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
        }


        public List<Customer> getCustomers()
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_GetCustomers";

            //mo ket noi
            sqlConection.Open();

            //thuc thi cong viec voi database
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

            //xu li du lieu tra ve
            var list = new List<Customer>();
            while (sqlDataReader.Read())
            {
                var customer = new Customer();
                for (int i = 0; i < sqlDataReader.FieldCount; i++)
                {
                    var colName = sqlDataReader.GetName(i);
                    var value = sqlDataReader.GetValue(i);

                    var property = customer.GetType().GetProperty(colName);

                    //nếu có property tương ứng vs tên cột thì gán dữ liệu tương ứng
                    if (property != null && value != DBNull.Value)
                    {
                        property.SetValue(customer, value);
                    }

                }
                list.Add(customer);
                //yield return customer;//return tung phan,do phai khoi tao
            }
            return list;
        }

        

        public Customer getCustomerById(Guid customerID)
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_GetCustomerById";

            //mo ket noi
            sqlConection.Open();

            //thuc thi cong viec voi database
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

            //xu li du lieu tra ve
            while (sqlDataReader.Read())
            {
                var customer = new Customer();
                for (int i = 0; i < sqlDataReader.FieldCount; i++)
                {
                    var colName = sqlDataReader.GetName(i);
                    var value = sqlDataReader.GetValue(i);

                    var property = customer.GetType().GetProperty(colName);

                    //nếu có property tương ứng vs tên cột thì gán dữ liệu tương ứng
                    if (property != null && value != DBNull.Value)
                    {
                        property.SetValue(customer, value);
                    }

                }
                return customer;
            }
            return null;
        }

        public int insertCustomers(Customer customer)
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_InsertCustomer";

            //gán giá trị đầu vào cho stored
            sqlCommand.Parameters.AddWithValue("@CustomerID", Guid.NewGuid());
            sqlCommand.Parameters.AddWithValue("@CustomerCode", customer.customerCode);
            sqlCommand.Parameters.AddWithValue("@Name", customer.customerName);
            sqlCommand.Parameters.AddWithValue("@CustomerPhone", customer.customerPhone);
            sqlCommand.Parameters.AddWithValue("@Birthday", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CompanyName", "MISA");
            sqlCommand.Parameters.AddWithValue("@Email", customer.customerEmail);
            sqlCommand.Parameters.AddWithValue("@Address", customer.customerAddress);
            sqlCommand.Parameters.AddWithValue("@Decription", "");
            sqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CreatedBy", "DTKhoi");
            sqlCommand.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CustomerGroupID", customer.customerGroup.customerGroupID);
            //sqlCommand.Parameters.AddWithValue("@CustomerGroupID", customer.customerGroup.customerGroupName);
            //Mo ket noi toi database
            sqlConection.Open();

            //thục thi
            var result = sqlCommand.ExecuteNonQuery();
            return result;
        }

        public int InsertCustomerGroup(CustomerGroup customerGroup)
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_InsertCustomerGroup";
            //gán giá trị đầu vào cho stored
            sqlCommand.Parameters.AddWithValue("@CustomerGroupID", new int());
            sqlCommand.Parameters.AddWithValue("@CustomerGroupName", customerGroup.customerGroupName);
            sqlCommand.Parameters.AddWithValue("@ParentID", customerGroup.parentGroupId);
            sqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CreatedBy", "DTKhoi");
            sqlCommand.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            //sqlCommand.Parameters.AddWithValue("@CustomerGroupID", customer.customerGroup.customerGroupName);
            //Mo ket noi toi database
            sqlConection.Open();

            //thục thi
            var result = sqlCommand.ExecuteNonQuery();
            return result;
        }

        public int updateCustomers(Customer customer)
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_UpdateCustomer";

            //gán giá trị đầu vào cho stored
            sqlCommand.Parameters.AddWithValue("@CustomerID", customer.customerID);
            sqlCommand.Parameters.AddWithValue("@CustomerCode", customer.customerCode);
            sqlCommand.Parameters.AddWithValue("@Name", customer.customerName);
            sqlCommand.Parameters.AddWithValue("@CustomerPhone", customer.customerPhone);
            sqlCommand.Parameters.AddWithValue("@Birthday", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CompanyName", "MISA");
            sqlCommand.Parameters.AddWithValue("@Email", customer.customerEmail);
            sqlCommand.Parameters.AddWithValue("@Address", customer.customerAddress);
            sqlCommand.Parameters.AddWithValue("@Decription", "");
            sqlCommand.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            sqlCommand.Parameters.AddWithValue("@CreatedBy", "DTKhoi");
            sqlCommand.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
            //sqlCommand.Parameters.AddWithValue("@CustomerGroupID", customer.customerGroup.customerGroupName);
            sqlCommand.Parameters.AddWithValue("@CustomerGroupID", "1");

            //Mo ket noi toi database
            sqlConection.Open();

            //thục thi
            var result = sqlCommand.ExecuteNonQuery();
            return result;
        }

        public int deteleCustomers(Guid customerID)
        {
            //Khai bao cau truy van
            sqlCommand.CommandText = "dbo.Proc_DeleteCustomer";

            //gán giá trị đầu vào cho stored
            sqlCommand.Parameters.AddWithValue("@CustomerID", customerID);

            //Mo ket noi toi database
            sqlConection.Open();

            //thục thi
            var result = sqlCommand.ExecuteNonQuery();
            return result;
        }

        public void Dispose()//xong khoi using se nhay vao day
        {
            //đóng kết nối
            sqlConection.Close();
        }


    }
}