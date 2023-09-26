const slime = {
	name: '슬라임'
}

const cuteSlime = {
	name: '슬라임',
	arrtibute: 'cute'
}
const purplecuteSlime = {
	name: '슬라임',
	arrtibute: 'cute',
	color: 'purple'
}

console.log(slime);
console.log(cuteSlime);
console.log(purplecuteSlime);
console.log('================================================');

//	... => spread 연산자 => ES6에서 추가 => 객체의 내용을 다른 객체에 퍼뜨린다. 확산시킨다.
const slime2 = {
	name: '슬라임2'
}

const cuteSlime2 = {
	...slime2, // slime2 객체의 내용을 cuteSlime2 객체 내부에 확산시킨다.
	arrtibute: 'cute'
}

const purplecuteSlime2 = {
	...cuteSlime2,
	color: 'purple'
}

console.log(slime2)
console.log(cuteSlime2)
console.log(purplecuteSlime2)

console.log('================================================');

// spread 연산자는 배열에도 사용할 수 있다.
const animals = ['개', '고양이', '참새'];
console.log(animals);

const animals2 =animals.concat('비둘기');
console.log(animals2);

const animals3 = [...animals, '닭둘기'];
console.log(animals3);















































































