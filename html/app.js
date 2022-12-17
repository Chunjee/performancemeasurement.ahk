const blueRange = chroma.scale(['#b2ebf2', '#0e3461']).colors(originalData.length);
const chartsArr = ["array", "string", "collection", "function", "lang", "math", "number", "object", "util"]

const speeds = _.map(originalData, "speed")
const minValue = _.min(speeds)
const maxValue = _.max(speeds)
const minRange = 0.1;
const maxRange = 1;

for (let i = 0; i < originalData.length; i++) {
	let scaledValue = (originalData[i].speed - minValue) / (maxValue - minValue) * (maxRange - minRange) + minRange;
	originalData[i].speed = _.round(scaledValue, 5);
}



try {
	chartsArr.forEach(element => {
		var ctx = document.getElementById(element + "Chart").getContext('2d');
		var ctx2 = document.getElementById(element + "Slow").getContext('2d');
		console.log(element)
		// format
		const data = {
			labels: [],
			datasets: [{
				data: [],
				backgroundColor: [],
			}],
		};
		var slowData = _.cloneDeep(data)

		// insert data into format
		originalData.forEach(function(item, index) {
			if (item.group != element) {
				return;
			}
		data.labels.push(item.label);
		data.datasets[0].data.push(item.speed);
		data.datasets[0].backgroundColor.push(blueRange[index]);
		});

		let FocusPercent = _.ceil((data.labels.length / 100) * 22) * -1
		if (FocusPercent > -3) {
			FocusPercent = -3
		}
		slowData.labels = _.reverse(data.labels.slice(FocusPercent));
		slowData.datasets[0].data = _.reverse(data.datasets[0].data.slice(FocusPercent))
		slowData.datasets[0].backgroundColor = _.reverse(data.datasets[0].backgroundColor.slice(FocusPercent));

		var myChart = new Chart(ctx, {
			type: 'bar',
			data: data,
			options: {
				responsive: true,
				legend: { display: false },
				scales: { yAxes: [{ ticks: { min: 0 } }] }
			}
		});

		var myChart2 = new Chart(ctx2, {
			type: 'horizontalBar',
			data: slowData,
			options: {
				responsive: true,
				legend: { display: false },
				scales: { xAxes: [{ ticks: { min: 0 } }] }
			}
		});
	});
} catch (error) {
	console.log(error)
	// do nothing
}
