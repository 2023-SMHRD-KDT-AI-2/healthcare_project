
												const submitButton = document.getElementById('submitButton');
												const errorMessage = document.getElementById('errorMessage');
												const inputID = document.getElementById('idOrEmail');
												let cnt = 0;

												submitButton.addEventListener('click', () => {
												    // 서버로부터 중복된 ID를 확인하는 비동기 함수
												    const loadIdCheck = async () => {
												        const data = {
												            method: 'POST',
												            headers: {
												                "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
												            },
												            body: `c=generalIDCheck&id=` + inputID.value
												        };

												        try {
												            const response = await fetch('/Main.say', data);
												            const res = await response.text();
												            cnt = parseInt(res); // 결과를 숫자로 변환합니다.
												            console.log("aa", cnt);

												            // 결과에 따라 메시지 스타일을 설정합니다.
												            if (cnt === 1) {
												                errorMessage.textContent = '중복된 ID입니다!';
												                errorMessage.classList.remove('success');
												                errorMessage.classList.add('error');
												            } else {
												                errorMessage.textContent = '중복되지 않은 ID사용가능';
												                errorMessage.classList.remove('error');
												                errorMessage.classList.add('success');
												            }
												        } catch (error) {
												            console.error(error);
												        }
												    }

												    // ID 체크 함수 호출
												    loadIdCheck();
												});

