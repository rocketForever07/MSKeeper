using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MISA.Entities;


namespace MISA.DL
{
    public class CustomerDL
    {
        public List<Customer> Get()
        {
            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.getCustomers();
            }
        }

        public Customer GetById(Guid customerID)
        {

            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.getCustomerById(customerID);
            }
        }

        public int Post(Customer customer)
        {

            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.insertCustomers(customer);
            }
        }

        public int Post(CustomerGroup customerGroup)
        {

            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.InsertCustomerGroup(customerGroup);
            }
        }

        public int Put(Customer customer)
        {//coi như không sửa trường customer-code

            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.updateCustomers(customer);
            }
        }

        public int Delete(Guid CustomerID)
        {
            using (DbContext dBContext = new DbContext())//doi tuong khoi tao trong khoi using se tu dong huy
            {
                return dBContext.deteleCustomers(CustomerID);
            }
        }
    }
}
