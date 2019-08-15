//삭제 버튼 관련 변수
const deleteButton = document.querySelector(".btn.delete");
// 수정 버튼 관련 변수
const updateButton = document.querySelector(".btn.update");
// modalchang의 gone(dispaly:none) 삭제 또는 추가 하기 위한 변수
const modals = document.querySelector(".modalchang");
// 모달창을 Close 하기 위해 만든 변수들
const modalsOverlay = modals.querySelector(".modalchang_overlay");
const modalsCloseBtn = modals.querySelector("#closeBtn");
// 모달창의 문구(h2)의 내용을 바꾸기 위해 만든 변수
const updateText = document.querySelector(".modalchang_content h2");
// 모달창 내부에 있는 폼태그를 조작하기 위해 폼태그를 담은 변수
const modalForm = document.querySelector(".modalchang_content form");

// 삭제 버튼 관련 함수 
const deleteModal = () => {
	updateText.innerHTML="해당 게시물을 정말 삭제하시겠습니까?";
	modalForm.action = "/fboard/delete";
	modals.classList.remove("gone");
}
// 모달창 숨기기 함수
const closeModals = () => {
	modals.classList.add("gone");
}
// 수정 버튼 관련 함수
const updateModal = () => {
	updateText.innerHTML="해당 게시물을 정말 수정하시겠습니까?";
	modalForm.action = "/fboard/updateForm";
	modals.classList.remove("gone");
}

modalsOverlay.addEventListener("click", closeModals);
modalsCloseBtn.addEventListener("click", closeModals);
deleteButton.addEventListener("click", deleteModal);
updateButton.addEventListener("click", updateModal);