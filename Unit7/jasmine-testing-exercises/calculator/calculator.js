window.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById("calc-form");
  if (form) {
    setupIntialValues();
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      update();
    });
  }
});

function getCurrentUIValues(amount, years, rate) {
  return {
    amount: +(document.getElementById("loan-amount").value),
    years: +(document.getElementById("loan-years").value),
    rate: +(document.getElementById("loan-rate").value)
  }
}

// Get the inputs from the DOM.
// Put some default values in the inputs
// Call a function to calculate the current monthly payment
function setupIntialValues() {
  let amount = document.getElementById("loan-amount");
  let years = document.getElementById("loan-years");
  let rate = document.getElementById("loan-rate");
  amount.value = 1000;
  years.value = 10;
  rate.value = 5;
}

// Get the current values from the UI
// Update the monthly payment
function update() {
  let dataObj = getCurrentUIValues();
  let monthly = calculateMonthlyPayment(dataObj);
  updateMonthly(monthly);
}

// Given an object of values (a value has amount, years and rate ),
// calculate the monthly payment.  The output should be a string
// that always has 2 decimal places.
function calculateMonthlyPayment(values) {
  let i = (values.rate / 100) / 12;
  let n = values.years * 12;
  let monthlyPayment = values.amount * i / (1 - Math.pow(1 + i, -n));
  let monthly = monthlyPayment.toFixed(2);
  return monthly;
}

// Given a string representing the monthly payment value,
// update the UI to show the value.
function updateMonthly(monthly) {
  let payment = document.getElementById("monthly-payment");
  payment.innerText = monthly;
}
