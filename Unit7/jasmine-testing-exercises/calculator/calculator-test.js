it('should calculate the monthly rate correctly', () => {
  let values = {
    amount: 1000,
    years: 100,
    rate: 5
  };
  let monthly = calculateMonthlyPayment(values);
  console.log(monthly);
  expect(calculateMonthlyPayment(values)).toEqual('4.20');

  values = {
    amount: 5000,
    years: 10,
    rate: 3
  };
  monthly = calculateMonthlyPayment(values);
  console.log(monthly);
  expect(calculateMonthlyPayment(values)).toEqual('48.28');

});

it("should return a result with 2 decimal places", function () {
  let values = {
    amount: 10000,
    years: 5,
    rate: 4.2
  };
  expect(calculateMonthlyPayment(values)).toEqual('185.07');


  values = {
    amount: 100,
    years: 3,
    rate: 5.1
  };
  expect(calculateMonthlyPayment(values)).toEqual('3.00');
});