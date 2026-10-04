// Mods.mm
#include "Mods.h"

Mods mods;

int (*old_get_attack)(void *instance);

int new_get_attack(void *instance) {
    if (mods.isCustomAttackEnabled) {
        return mods.customAttackValue;
    }
    return old_get_attack(instance);
}

// 定義 BinaryName（header 已在 extern "C" 內宣告，這裡直接定義即可）
char* BinaryName = "UnityFramework";

void LoadMods() {
    HOOK(0x2BE5EA4, new_get_attack, old_get_attack);
}
