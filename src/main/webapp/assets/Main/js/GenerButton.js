													var labels = document
															.querySelectorAll(".btn");

													labels
															.forEach(function(
																	label) {
																label
																		.addEventListener(
																				"click",
																				function() {
																					labels
																							.forEach(function(
																									l) {
																								l.classList
																										.remove("btn-primary");
																								l.classList
																										.add("btn-secondary");
																							});

																					label.classList
																							.remove("btn-secondary");
																					label.classList
																							.add("btn-primary");
																				});
															});
