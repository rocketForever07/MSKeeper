using MISA.DL;
using MISA.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace MISA.BL
{
    public class CustomerBL
    {
        public List<Customer> GetCustomers()
        {
            var customerDL = new CustomerDL();

            return customerDL.Get();
        }

        public Customer GetCustomerByID(Guid customerID)
        {
            var customerDL = new CustomerDL();
            //kiem tra loi trung ma

            return customerDL.GetById(customerID);
        }

        public int InsertCustomers(Customer customer)
        {
            var customerDL = new CustomerDL();
            //kiem tra loi trung ma
            return customerDL.Post(customer);
            
        }

        public int InsertGroupCustomer(CustomerGroup customerGroup)
        {
            var customerDL = new CustomerDL();
            //kiem tra loi trung ma
            return customerDL.Post(customerGroup);

        }

        public int UpdateCustomers(Customer customer)
        {
            var customerDL = new CustomerDL();
            customerDL.Put(customer);
            return 1;
        }

        public int DeleteCustomer(Guid customerID)
        {
            var customerDL = new CustomerDL();
            customerDL.Delete(customerID);

            return 1;
        }
    }
}
