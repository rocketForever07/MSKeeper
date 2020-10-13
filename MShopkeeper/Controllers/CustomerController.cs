using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MISA.Entities;
using MISA.BL;

namespace MISA.MShopkeeper.Controllers
{
    [RoutePrefix("customers")]

    public class CustomerController : ApiController
    {
        // get all
        [Route("")]
        public IEnumerable<Customer> Get()
        {
            var customerBL = new CustomerBL();
            return customerBL.GetCustomers();
        }

        // get by id
        [Route("{customerID}")]
        public Customer GetByID(Guid customerID)
        {
            var customerBL = new CustomerBL();
            return customerBL.GetCustomerByID(customerID);

        }

        // add customer
        [Route("")]
        public int Post([FromBody]Customer customer)
        {
            var customerBL = new CustomerBL();
            return customerBL.InsertCustomers(customer);
        }

        //add group
        [Route("groupCustomer")]
        public int Post([FromBody]CustomerGroup customerGroup)
        {
            var customerBL = new CustomerBL();
            return customerBL.InsertGroupCustomer(customerGroup);
        }

        // Sua
        [Route("")]
        public int Put([FromBody]Customer customer)
        {
            var customerBL = new CustomerBL();
            return customerBL.UpdateCustomers(customer);
        }

        //xoa
        public int Delete(Guid customerID)
        {
            var customerBL = new CustomerBL();
            return customerBL.DeleteCustomer(customerID);
        }
    }
}
