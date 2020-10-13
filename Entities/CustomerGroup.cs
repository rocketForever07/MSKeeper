using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MISA.Entities
{
    public class CustomerGroup
    {
        public Guid customerGroupID { get; set; }
        public string customerGroupCode { get; set; }
        public string customerGroupName { get; set; }
        public string parentGroupId { get; set; }
        public string customerDec { get; set; }
    }
}
