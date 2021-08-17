describe("Servers test (with setup and tear-down)", function () {
    beforeEach(function () {
        // initialization logic
        // serverNameInput.value = 'Alice';
        billAmtInput.value = 100;
        tipAmtInput.value = 20
    });

    it('should sum Payment on sumPaymentTotal(type)', function () {
        let CurPayment = createCurPayment();
        expect(CurPayment.billAmt).toEqual('100');
        expect(CurPayment.tipAmt).toEqual('20');
        expect(CurPayment.tipPercent).toEqual(20);
    });

    it('should calculate tip percent on calculateTipPercent(billAmt, tipAmt)', function () {
        let tipPercent = calculateTipPercent(billAmtInput.value, tipAmtInput.value);
        expect(tipPercent).toEqual(20);
    });

    it('should append td on appendTd(tr, value)', function () {
        let curPayment = createCurPayment();
        appendPaymentTable(curPayment);
        let td = document.querySelector('td');
        expect(td.innerText).toEqual('$100');
        let tr = document.getElementById('payment0');
        expect(tr.childNodes[3].innerText).toEqual('X');
    });

    afterEach(function () {
        serverNameInput.value = '';
        allServers = {};
        serverId = 0;
    });
});
