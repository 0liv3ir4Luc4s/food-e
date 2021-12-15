let id = id => {
    let element = document.getElementById(id);
    try {
        if(element) {
            masks[id]();
        }
    } catch(ex) {
        console.error("Erro ao buscar elemento no objeto masks");
    } finally {
        return element;
    }
};
function phoneMaskFunc(){
    var phoneMask = new Cleave('#phone', {
        blocks: [3, 14],
    });
}
function zipMaskFunc(){
    var zipMask = new Cleave('#zip', {
        delimiter: '-',
        blocks: [5, 3],
        uppercase: true
    });
}
function cardnumberMaskFunc(){
    var cardnumberMask = new Cleave('#cardnumber', {
        creditCard: true,
    });
}

let masks = {"phone": phoneMaskFunc, "zip": zipMaskFunc, "cardnumber": cardnumberMaskFunc};

let name = id("name");
let email = id("email");
let phone = id("phone");
let password = id("password");
let address_1 = id("address-1");
let address_2 = id("address-2");
let zip = id("zip");
let city = id("city");
let cardnumber = id("cardnumber");
let cvv = id("cvv");

let form = document.getElementById("form");

form.onsubmit = e => {
        let invalidInputs = [];
        let validInputs = [];

        email != null && isEmail(email.value) ? validInputs.push(email) : invalidInputs.push(email);

        name != null && name.value != "" ?  validInputs.push(name) : invalidInputs.push(name);

        phone != null && isPhone(phone.value) ? validInputs.push(phone) : invalidInputs.push(phone);

        password != null && isPassword(password.value) ? validInputs.push(password) : invalidInputs.push(password);

        address_1 != null && address_1.value != "" ? validInputs.push(address_1) : invalidInputs.push(address_1); 

        address_2 != null && address_2.value != "" ? validInputs.push(address_2) : invalidInputs.push(address_2); 

        zip != null && isZIP(zip.value) ? validInputs.push(zip) : invalidInputs.push(zip);

        city != null && isCity(city.value) ? validInputs.push(city) : invalidInputs.push(city);

        cardnumber != null && isCardNumber(cardnumber.value.replace(/\s+/g, '')) ? validInputs.push(cardnumber) : invalidInputs.push(cardnumber);

        cvv != null && isCVV(cvv.value) ? validInputs.push(cvv) : invalidInputs.push(cvv);

        validInputs.map(validInput => setValid(validInput));
        if(invalidInputs.length > 0) {
            e.preventDefault();
            invalidInputs.map(invalidInput => setInvalid(invalidInput));
        }
    }

function setInvalid(input) {
    if(input != null) {
        input.parentElement.classList.remove("valid")
        input.parentElement.classList.add("invalid");
    }
}

function setValid(input) {
    input.parentElement.classList.remove("invalid")
    input.parentElement.classList.add("valid");
}

function isEmail(email) {
  return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

function isPhone(phone) {
    return /^\+(?:[0-9] ?){6,14}[0-9]$/.test(phone);
}

function isPassword(password) {
    return /^[\s\S]{8,32}$/.test(password) &&
           /[A-Z]/.test(password) &&
           /[a-z]/.test(password) &&
           /[0-9]/.test(password) &&
           /[!"#$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~]/.test(password);
}

function isZIP(zip) {
    return /^\d{5}-\d{3}$/.test(zip);
}

function isCity(city) {
    return /^([a-zA-Z\u0080-\u024F]+(?:. |-| |'))*[a-zA-Z\u0080-\u024F]*$/.test(city);
}

function isCardNumber(cardnumber) {
    let digits = cardnumber.split('');
    for (let i = 0; i < digits.length; i++) {
        digits[i] = parseInt(digits[i], 10);
    }  
    let sum = 0;
    let alt = false;
    for (i = digits.length - 1; i >= 0; i--) {
        if (alt) {
            digits[i] *= 2;
            if (digits[i] > 9) {
                digits[i] -= 9;
            }
        }
        sum += digits[i];
        alt = !alt;
    }

    if (sum % 10 == 0) {
        return /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
    } else {
        return false;
    }
}

function isCVV(cvv) {
    return /^[0-9]{3,4}$/.test(cvv);
}