#include "Mods.h"

// 告訴程式我們要修改的目標
char* BinaryName = "UnityFramework";

// 1. 宣告兩個全域變數，用來跟選單溝通
bool isCustomAttackEnabled = false; // 控制開關
int customAttackValue = 9999;       // 預設攻擊力數值

// 2. 準備一個指標，用來儲存遊戲「原本」的攻擊力函數
int (*old_get_attack)(void *instance);

// 3. 這是我們私自改造的「新攻擊力函數」
int new_get_attack(void *instance) {
    if (isCustomAttackEnabled) {
        // 如果選單開關有打開，強行回傳你在選單輸入的數值
        return customAttackValue;
    }
    // 如果開關沒開，就放行，回傳遊戲正常的攻擊力
    return old_get_attack(instance);
}

void LoadMods()
{
    // 4. 遊戲啟動時，直接在 0x2BE5EA4 設立攔截點 (Hook)
    // 把原本的函數掉包成我們寫的 new_get_attack
    HOOK(0x2BE5EA4, new_get_attack, old_get_attack);
}
