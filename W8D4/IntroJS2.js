function titleize(names, callback) {
    let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titleized);
};


titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
});

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
};

Elephant.prototype.aStatement = function() {
    console.log(`${this.name} is this ${this.height} inches tall and loves ${this.tricks}.`);
};

const elep1 = new Elephant("Elly", 23, ["bowling"]);
const elep2 = new Elephant("Dino", 234, ["jousting"]);

console.log(elep1.aStatement());
console.log(elep2.aStatement());

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
};

console.log(elep1.trumpet());
console.log(elep2.trumpet());

Elephant.prototype.grow = function() {
    this.height = this.height + 12;
};

console.log(elep1.grow());
console.log(elep1.aStatement());

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
};

console.log(elep2.addTrick(" dancing"));
console.log(elep2.aStatement());

Elephant.prototype.play = function () {
    trickIdx = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[trickIdx]}!`);
};

console.log(elep1.play());

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
};

Elephant.paradeHelper(elep1);

