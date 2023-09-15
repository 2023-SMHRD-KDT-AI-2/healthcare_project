
								// 파일 입력 필드
								var fileInput = document
										.getElementById("fileInput");

								// 이미지 미리보기를 표시할 이미지 요소
								var imagePreview = document
										.getElementById("imagePreview");

								// 파일 입력 필드가 변경될 때마다 호출되는 함수
								 fileInput.addEventListener('change', function () {
            const file = fileInput.files[0];
            
            if (file) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    imagePreview.src = e.target.result;
                };

                reader.readAsDataURL(file);
            } else {
                imagePreview.src = 'default-image.jpg'; // 이미지가 첨부되지 않았을 때 기본 이미지 표시
            }
        });