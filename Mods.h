// Mods.h
#ifndef MODS_H
#define MODS_H

#include <string>
#include "Includes/Hooking/JailedHook.h"  // HOOK macro 需要

struct Mods {
    // 既有欄位保留（相容舊 widget）
    bool bool1 = false, bool2 = false, bool3 = false;
    std::string myText = "Initial Text";
    std::string inputText = "";
    float floatVal = 0;
    int intval = 0, intval2 = 0;

    // 新增：自訂攻擊力
    bool isCustomAttackEnabled = false;
    int customAttackValue = 9999;
};

extern Mods mods;           // 宣告
void LoadMods();            // 宣告

#endif
