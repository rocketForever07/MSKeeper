using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MISA.Entities
{
    public class Customer
    {
        public static List<Customer> list = new List<Customer>()
        {
            new Customer(){ customerID=Guid.NewGuid(), customerCode="Nv0001",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"},
            new Customer(){customerID=Guid.NewGuid(),customerCode="Nv0002",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"},
            new Customer(){customerID=Guid.NewGuid(),customerCode="Nv0003",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"},
            new Customer(){customerID=Guid.NewGuid(),customerCode="Nv0004",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"},
            new Customer(){customerID=Guid.NewGuid(),customerCode="Nv0005",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"},
            new Customer(){customerID=Guid.NewGuid(),customerCode="Nv0006",customerName="Doan Trong Khoi",customerPhone="0348421880",customerEmail="doantrongkhoi711@gmai.com"}

        };
        
        public Guid customerID { get; set; }
        public string customerCode { get; set; }
        public string customerName { get; set; }
        public string customerPhone { get; set; }
       // public string customerGroup { get; set; }
        public string customerEmail { get; set; }
        public string customerAddress { get; set; }
        public string customerDec { get; set; }
        public string companyName { get; set; }
        public CustomerGroup customerGroup { get; set; }


    }
}
