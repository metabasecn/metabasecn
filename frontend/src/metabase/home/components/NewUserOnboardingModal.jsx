/* @flow */
import React, { Component } from "react";
import StepIndicators from 'metabase/components/StepIndicators';
import RetinaImage from 'react-retina-image'

import MetabaseSettings from "metabase/lib/settings";

type Props = {
    onClose: () => void,
}

type State = {
    step: number
}

const STEPS = [
    {
        title: '提出问题并且探索结果',
        text: '单击图表或表格来探索，或者使用易用界面或功能强大的SQL编辑器询问一个新问题。',
        image: (
            <RetinaImage
                className="absolute full"
                style={{ top: 30 }}
                src={`app/assets/img/welcome-modal-1.png`}
            />
        )
    },
    {
        title: '设置您的图表',
        text: '创建曲线图，饼图，或者其他',
        image: (
            <RetinaImage
                className="absolute ml-auto mr-auto inline-block left right"
                style={{ bottom: -20,}}
                src={`app/assets/img/welcome-modal-2.png`}
            />
        )
    },
    {
        title: '分享您的结果',
        text: '创建一个直观的仪表板团队分享或者email分享',
        image: (
            <RetinaImage
                className="absolute ml-auto mr-auto inline-block left right"
                style={{ bottom: -30 }}
                src={`app/assets/img/welcome-modal-3.png`}
            />
        )
    },
]


export default class NewUserOnboardingModal extends Component {

    props: Props
    state: State = {
        step: 1
    }

    nextStep = () => {
        const stepCount = MetabaseSettings.get("has_sample_dataset") ? 3 : 2
        const nextStep = this.state.step + 1;

        if (nextStep <= stepCount) {
            this.setState({ step: nextStep });
        } else {
            this.props.onClose();
        }
    }

    render() {
        const { step } = this.state;
        const currentStep = STEPS[step -1]

        return (
            <div>
                <OnboardingImages
                    currentStep={currentStep}
                />
                <div className="p4 pb3 text-centered">
                    <h2>{currentStep.title}</h2>
                    <p className="ml-auto mr-auto text-paragraph" style={{ maxWidth: 420 }}>
                        {currentStep.text}
                    </p>
                    <div className="flex align-center py2 relative">
                        <div className="ml-auto mr-auto">
                            <StepIndicators
                                currentStep={step}
                                steps={STEPS}
                                goToStep={step => this.setState({ step })}
                            />
                        </div>
                        <a
                            className="link flex-align-right text-bold absolute right"
                            onClick={() => (this.nextStep())}
                        >
                            { step === 3 ? 'Let\'s go' : 'Next' }
                        </a>
                    </div>
                </div>
            </div>
        );
    }
}

const OnboardingImages = ({ currentStep }, { currentStep: object }) =>
    <div style={{
        position: 'relative',
        backgroundColor: '#F5F9FE',
        borderBottom: '1px solid #DCE1E4',
        height: 254,
        paddingTop: '3em',
        paddingBottom: '3em'
    }}>
        { currentStep.image }
    </div>
