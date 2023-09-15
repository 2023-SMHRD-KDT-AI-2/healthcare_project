
													// name 요소와 표시할 요소를 가져옵니다.
													var nameInput = document
															.getElementById("name");
													var displayName = document
															.getElementById("displayName");
													// email 요소와 표시할 요소를 가져옵니다.
													var emailInput = document
															.getElementById("idOrEmail");
													var displayEmail = document
															.getElementById("displayEmail");

													// 입력 값이 변경될 때마다 실행되는 함수를 만듭니다.
													nameInput
															.addEventListener(
																	"input",
																	function() {
																		// 입력된 값을 가져와서 표시할 요소에 넣습니다.
																		var enteredName = nameInput.value;
																		displayName.textContent = enteredName;
																	});
													// 입력 값이 변경될 때마다 실행되는 함수를 만듭니다.
													emailInput
															.addEventListener(
																	"input",
																	function() {
																		// 입력된 값을 가져와서 표시할 요소에 넣습니다.
																		var enteredEmail = emailInput.value;
																		displayEmail.textContent = enteredEmail;
																	});
							