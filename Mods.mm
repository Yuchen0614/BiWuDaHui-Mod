#include "Mods.h"

// 定義實體（只能在一個 .mm/.cpp）
Mods mods;

// 原本的舊函數指標
int (*old_get_attack)(void *instance);

int new_get_attack(void *instance) {
    if (mods.isCustomAttackEnabled) {
        return mods.customAttackValue;
    }
    return old_get_attack(instance);
}

// 定義 BinaryName，指定 C linkage 配合 JailedHook.h 宏展開
extern "C" char* BinaryName = "UnityFramework";

void LoadMods() {
    HOOK(0x2BE5EA4, new_get_attack, old_get_attack);
}
