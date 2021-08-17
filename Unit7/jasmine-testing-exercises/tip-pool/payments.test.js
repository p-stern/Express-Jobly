describe("Payments test", function () {
    beforeEach(function () {
        // initialization logic
        billAmtInput.value = 100;
        tipAmtInput.value = 20
        paymentId = 0;
    });

    it('should add a payment to allPayments on submitPaymentInfo()', function () {
        submitPaymentInfo();
        expect(Object.keys(allPayments).length).toEqual(1);
        expect(allPayments['payment1'].billAmt).toEqual('100');
        expect(allPayments['payment1'].tipAmt).toEqual('20');
        expect(allPayments['payment1'].tipPercent).toEqual(20);
    });

    it('should create Payment on createCurPayment()', function () {
        let curPayment = createCurPayment();
        expect(curPayment.billAmt).toEqual('100');
        expect(curPayment.tipAmt).toEqual('20');
        expect(curPayment.tipPercent).toEqual(20);
    });

    it('should append on appendPaymentTable(curPayment)', function () {
        let curPayment = createCurPayment();
        appendPaymentTable(curPayment);

        let tr = document.querySelectorAll('#payment0 td');
        expect(tr.length).toEqual(4);
        expect(tr[0].innerText).toEqual("$100");
        expect(tr[1].innerText).toEqual("$20");
        expect(tr[2].innerText).toEqual("20%");
        expect(tr[3].innerText).toEqual("X");
    });
});

afterEach(function () {
    billAmtInput.value = 100;
    tipAmtInput.value = 20
});