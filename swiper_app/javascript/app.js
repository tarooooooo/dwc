// let orange = 100;
// let apple = 120;
//
// if(orange < apple){
//     alert('みかんの値段がりんごより安い');
// } else if(orange == apple){
//     alert('みかんとりんごが同じ値段');
// } else{
//     alert('みかんの値段がりんごより高い');
// }
//
// // メイン部分
// let alertString;
//
// // 作成した関数を呼び出し、変数へ格納
// alertString = addString("WebCamp");
//
// //変数の中身をアラートで表示する
// alert(alertString);
//
// function addString(strA){
//     let addStr = "Hello " + strA;
//     return addStr;
// }
//
// let promptStr = prompt('何か好きな文字を入力してください。');
//
// alert(promptStr);
//

// let user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください。');
//
// alert('あなたの選んだ手は' + user_hand + 'です。');
function getUserhand() {
    // Valid choices for the game
    const choices = ["グー", "チョキ", "パー"];
    // Prompt the user for their choice
    let user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください。');

    // Keep asking until the user provides a valid choice or cancels
    while (user_hand !== null && !choices.includes(user_hand)) {
        alert('グー・チョキ・パーのいずれかを入力して下さい');
        user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください。');
    }

    // If the user didn't cancel, proceed with the game
    if (user_hand !== null) {
        // Get the computer's choice
        let js_hand = getJShand();
        // Determine the result
        let judge = winLose(user_hand, js_hand);
        // Display the result
        alert(`あなたの選んだ手は${user_hand}です。\nJavaScriptの選んだ手は${js_hand}です。\n結果は${judge}です。`);
    } else {
        alert("またチャレンジしてね");
    }
}

getUserhand()

// ランダムでじゃんけんの手を作成する関数
function getJShand(){
    let js_hand_num = Math.floor( Math.random() * 3 );
    let hand_name;

    if(js_hand_num == 0){
        hand_name = "グー";
    } else if(js_hand_num == 1){
        hand_name = "チョキ";
    } else if(js_hand_num == 2){
        hand_name = "パー";
    }

    return hand_name;
}

// ユーザの手とJavaScriptのじゃんけんの手を比べる関数
function winLose(user, js){
    let winLoseStr;

    if(user == "グー"){
        if(js == "グー"){
            winLoseStr = "あいこ";
        } else if(js == "チョキ"){
            winLoseStr = "勝ち";
        } else if(js == "パー"){
            winLoseStr = "負け";
        }
    } else if(user == "チョキ"){
        if(js == "グー"){
            winLoseStr = "負け";
        } else if(js == "チョキ"){
            winLoseStr = "あいこ";
        } else if(js == "パー"){
            winLoseStr = "勝ち";
        }
    } else if(user == "パー"){
        if(js == "グー"){
            winLoseStr = "勝ち";
        } else if(js == "チョキ"){
            winLoseStr = "負け";
        } else if(js == "パー"){
            winLoseStr = "あいこ";
        }
    }

    return winLoseStr;
}