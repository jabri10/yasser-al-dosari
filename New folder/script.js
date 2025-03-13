async function askQuestion() {
    const question = document.getElementById('question-input').value;
    if (!question) {
        alert('Please enter a question.');
        return;
    }

    const answerOutput = document.getElementById('answer-output');
    answerOutput.innerText = 'Processing...';

    // For now, we'll simulate an AI response
    const response = await getAIResponse(question);
    answerOutput.innerText = response;
}

async function getAIResponse(question) {
    // Simulate an API call to the AI model
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(`This is a simulated answer to: "${question}"`);
        }, 1000);
    });
}