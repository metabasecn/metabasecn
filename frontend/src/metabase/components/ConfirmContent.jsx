import React from "react";

import ModalContent from "metabase/components/ModalContent.jsx";

const nop = () => {};

const ConfirmContent = ({
    title,
    content,
    message = "确定?",
    onClose = nop,
    onAction = nop,
    onCancel = nop,
    confirmButtonText = "确定",
    cancelButtonText = "取消"
}) =>
    <ModalContent
        title={title}
        onClose={() => { onCancel(); onClose(); }}
    >
        <div className="mx4">{content}</div>

        <div className="Form-inputs mb4">
            <p>{message}</p>
        </div>

        <div className="Form-actions">
            <button className="Button Button--danger" onClick={() => { onAction(); onClose(); }}>{confirmButtonText}</button>
            <button className="Button ml1" onClick={() => { onCancel(); onClose(); }}>{cancelButtonText}</button>
        </div>
    </ModalContent>

export default ConfirmContent;
