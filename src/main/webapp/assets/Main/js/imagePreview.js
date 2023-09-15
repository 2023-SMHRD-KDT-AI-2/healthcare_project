
								// 파일 입력 필드
								var fileInput = document
										.getElementById("fileInput");

								// 이미지 미리보기를 표시할 이미지 요소
								var imagePreview = document
										.getElementById("imagePreview");

								// 파일 입력 필드가 변경될 때마다 호출되는 함수
								fileInput
										.addEventListener(
												"change",
												function() {
													var file = fileInput.files[0];

													if (file) {
														var reader = new FileReader();

														reader.onload = function(
																e) {
															imagePreview.src = e.target.result;
														};

														reader
																.readAsDataURL(file);
													} else {
														// 파일을 선택하지 않았을 때의 처리
														imagePreview.src = "";
													}
												});
				