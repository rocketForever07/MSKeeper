$(document).ready(function () {
    var customerJS = new CustomerJS();
});

class CustomerJS {
    constructor() {
        this.FormMode = null;
        this.initEvents();
        this.loadData();
    }

    initEvents() {
      
        //valid du lieu
        $('.required').blur(this.checkRequired);

        //
        $('.toobar-button-add').click(this.btnAdd.bind(this));
        $('#dialog-add-exit').click(this.hideDialog);
        $('tbody tr').click(this.markRowClicked);

        //save
        $('.dialog-add-save').click(this.buttonSave.bind(this));


        //them nhan vien
        $('#open-sub').click(this.showSubDialog);
        $('.dialog-add-remove').click(this.cleanDialogAdd);

        //nhom nhan vien
        $('.sub-dialog-exit').click(this.hideSubDialog);
        $('.sub-dialog-remove').click(this.cleanSubDialog);

        //edit nhan vien
        $('.toobar-button-edit').click(this.btnEdit.bind(this));

        //them nhom kh
        $('.sub-dialog-save').click(this.buttonSaveGroup.bind(this));
            
    }

    loadData() {
        debugger;
        var seft = this;
        //lấy dữ liệu trên server thông qua lời gọi tới service
        $.ajax({
            url: "https://localhost:44359/customers",
            method: "GET",
            data: "",//tham số sẽ truyền qua body request
            contentType: "application.json",
            dataType: "",
            success: function () {
            }
        }).done(function (res) {
            $('tbody').empty();
            if (res) {
                //$("tbody").empty();
                res.forEach(function (item) {
                    var html_tr = $(`<tr customerID=` + item.customerID+ `>
                            <td>`+ `<input type="checkbox" name="group1[]" />` + `</td>
                            <td>`+ item.customerCode + `</td>
                            <td>`+ item.customerName + `</td>
                            <td>`+ item.customerPhone + `</td>
                            <td>`+ item.customerEmail + `</td>
                            <td>`+ `` + `</td>
                            </tr>
                            `);
                    $("tbody").append(html_tr);
                })
            }
        }).fail(function (reponse) {
            debugger;
        })
    }

    /*Các hàm hiện thị và ẩn dialog*/
    showDialogAdd() {
        this.FormMode = 'add';
        $('.dialog-add input').val('');
        $('.dialog-modal').show();
        $('.dialog-add').show();
    }
    hideDialog() {
        $('.dialog-add').hide();
        $('.dialog-modal').hide();
        this.FormMode = null;
    }

    showDialogEdit() {
        this.FormMode = 'edit';
        $('.dialog-add input').val('');
        $('.dialog-modal').show();
        $('.dialog-add').show();
    }


    showSubDialog() {
        $('.sub-dialog input').val('');
        $('.dialog-modal-sub').show();
        $('.sub-dialog').show();
    }
    hideSubDialog() {
        $('.sub-dialog').hide();
        $('.dialog-modal-sub').hide();
    }

    cleanDialogAdd() {
        $('.dialog-add input').val('')
    }

    cleanSubDialog() {
        $('.sub-dialog input').val('');
    }

    /*add option to select*/
    addOption() {
        var optionText =$('.group-name').val();
        var optionValue = $('.group-name').val();

        $('select').append(`<option value="${optionValue}"> 
                                       ${optionText} 
                                  </option>`);
    } 


    /*Hàm đánh dấu row được chọn*/
    markRowClicked() {
        var a = $(this);
        if (!a.hasClass('row-selected')) {

            $('tr.row-selected').removeClass('row-selected');

            a.addClass('row-selected');
        } else {
            a.removeClass('row-selected');
        }
    }
    /*hàm check required add-dialog*/
    checkRequired() {
        var value = this.value;
        if (!value) {
            $(this).addClass('required-error');
        }
        else {
            $(this).removeClass('required-error');
        }
    }

    /*load data on dialog*/

    /*chi tiet them nhan vien*/
    btnAdd() {
        this.showDialogAdd();
    }
    AddSave() {

        var customer = {};
        var seft = this;

        //lấy dữ liệu và check

        if ($("#customer-code").val() && $("#customer-name").val() && $("#customer-phone").val()) {
            
            this.hideDialog();

            customer.customerCode = $('#customer-code').val();
            customer.customerName = $('#customer-name').val();
            customer.customerPhone = $('#customer-phone').val();
            customer.customerEmail = $("#customer-email").val();
            customer.customerAddress = $("#customer-email").val();

            //cất dũ liệu vào database
            $.ajax({ 
                data: JSON.stringify(customer),
                url: "/Customers",
                method: "POST",
                contentType: "application/json",
                dataType: "json"
            }).done(function (response) {
                debugger;
                seft.loadData();
            }).fail(function (response) {
                debugger;
            })
        }

    }

    /*chi tiet sua nhan vien*/
    getID() {
        var trSelected = $('tbody tr.row-selected');

    }
    //btn edit
    btnEdit() {
        //lấy dữ liệu customer cần sửa
        //1.xác định customer tương ứng đã chọn
        var trSelected = $('tr.row-selected');
        var seft = this;
        //2.lấy id nhân viên
        if (trSelected.length > 0) {
            //hiển thị thông tin chi tiết
            seft.showDialogEdit();
            var customerID = trSelected.attr('customerID');
            //3.gửi id lên api service để lấy về dữ liệu đầy đủ
            $.ajax({
                url: "/Customers/" + customerID,
                method: 'GET'
            }).done(function (res) {
                if (res) {
                    //binnding cac thong tin cua nhan vien tren form
                    $('#customer-code').val(res["customerCode"]);
                    $('#customer-name').val(res["customerName"]);
                    $('#customer-phone').val(res["customerPhone"]);
                    $('#group-select').val(res["customerGroup"]);
                    $('#customer-email').val(res["customerEmail"]);
                    $('#customer-addredd').val(res["customerAddress"]);
                }
                //chinh sua du lieu tren form
            }).fail(function (res) {

            })
        }
    }
    EditSave() {
        //cat du lieu sau khi chinh sua
        //1.thu thap thong tin da chinh sua
        if ($("#customer-code").val() && $("#customer-name").val() && $("#customer-phone").val()) {
            this.hideDialog();
            var seft = this;
            var customerEdit = {};
            customerEdit["customerCode"] = $('#customerCode').val();
            customerEdit["customerName"] = $('#customerName').val();
            customerEdit["customerPhone"] = $('#customerPhone').val();
            customerEdit["customerEmail"] = $('#customerEmail').val();
            customerEdit["customerAddress"] = $('#customerAddress').val();
            customerEdit["customerGroup"] = $('#group-select').val();

            //2.goi api de cat du lieu
            $.ajax({
                url: "/Customer",
                method: "PUT",
                data: customerEdit,
                contentType: 'application/json',
                dataType: 'json'
            }).done(function (res) {
                if (res) {
                    seft.loadData();
                }
            })
        }
    }

    btnDelete() {

        //1.xác định customer tương ứng đã chọn
        var trSelected = $('tr.row-checked');
        if (trSelected.length > 0) {
            //hiển thị dialog delete
            this.ShowCancelDialog();
            //2.lấy mã nhân viên
            var customerID = trSelected.attr('customerID');
            //3.gửi customerID lên api để xóa
            $.ajax({
                url: "/Customers" + "/" + customerCode,
                method: 'DELETE'
            }).done(function (res) {

            }).fail(function (res) {

            })
        }
        else {
            alert('bạn chưa chọn nhân viên');
        }
    }

    /*them nhom khach hang*/
    buttonSaveGroup() {
        var customerGroup = {};
        var seft = this;

        //lấy dữ liệu và check

        if ($('.group-code').val() && $('.group-name').val() ) {

            this.hideSubDialog();
            this.addOption();
            $('#group-select').val($('.group-name').val());

            customerGroup.customerGroupCode = $('.group-code').val();
            customerGroup.cus = $('.group-name').val();
            customerGroup.parentGroupId = $('.group-parent').val();
            customerGroup.customerDec = $(".group-desc").val();

            //cất dũ liệu vào database
            $.ajax({
                data: JSON.stringify(customerGroup),
                url: "/Customers/groupCustomer",
                method: "POST",
                contentType: "application/json",
                dataType: "json"
            }).done(function (response) {
                debugger;
                seft.loadData();
            }).fail(function (response) {
                debugger;
            })
        }

    }

    


    buttonSave() {

        if (this.FormMode == 'edit') {
            this.EditSave();
        }
        else {
            this.AddSave();
        }
    }

    buttonSaveAdd() {
        if (this.FormMode == 'edit') {
            this.EditSave();
            this.showDialogAdd();
        }
        else {
            this.AddSave();
            this.showDialogEdit();
        }
    }





    
}

