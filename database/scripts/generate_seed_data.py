#!/usr/bin/env python3
"""
Health-Diet 食疗养生小程序 - 测试数据生成脚本
生成内容：
- 50+ 条食疗配方
- 30+ 条内容数据
- 20+ 测试用户
- 100+ 条评论
"""

import json
import random
from datetime import datetime, timedelta
from typing import List, Dict, Any

# ============ 数据定义 ============

# 食疗配方数据
RECIPES_DATA = [
    # 养胃类
    {"name": "山药小米粥", "crowd": ["中老年", "白领", "通用"], "efficacy": ["健脾养胃"], "solar": ["秋季", "冬季"], "calories": 180, "protein": 6, "fat": 2, "carbs": 35},
    {"name": "南瓜红枣粥", "crowd": ["中老年", "女性", "儿童"], "efficacy": ["健脾养胃", "补气养血"], "solar": ["秋季", "冬季"], "calories": 220, "protein": 5, "fat": 1, "carbs": 45},
    {"name": "猴头菇炖鸡汤", "crowd": ["中老年", "白领"], "efficacy": ["健脾养胃", "增强免疫"], "solar": ["冬季", "立冬", "小雪"], "calories": 280, "protein": 25, "fat": 15, "carbs": 8},
    {"name": "莲子百合粥", "crowd": ["中老年", "女性"], "efficacy": ["健脾养胃", "安神助眠"], "solar": ["秋季", "白露", "秋分"], "calories": 160, "protein": 5, "fat": 1, "carbs": 32},
    {"name": "茯苓山药排骨汤", "crowd": ["中老年", "通用"], "efficacy": ["健脾养胃", "祛湿排毒"], "solar": ["春季", "夏季"], "calories": 320, "protein": 22, "fat": 18, "carbs": 12},
    {"name": "陈皮瘦肉粥", "crowd": ["中老年", "儿童"], "efficacy": ["健脾养胃"], "solar": ["四季"], "calories": 200, "protein": 12, "fat": 6, "carbs": 25},
    {"name": "芡实薏米粥", "crowd": ["中老年", "女性"], "efficacy": ["健脾养胃", "祛湿排毒"], "solar": ["夏季", "秋季"], "calories": 170, "protein": 5, "fat": 1, "carbs": 34},
    {"name": "生姜红糖暖胃汤", "crowd": ["女性", "中老年"], "efficacy": ["健脾养胃", "补气养血"], "solar": ["冬季", "小寒", "大寒"], "calories": 120, "protein": 1, "fat": 0, "carbs": 28},
    
    # 润肺类
    {"name": "川贝雪梨汤", "crowd": ["儿童", "中老年", "通用"], "efficacy": ["润肺止咳"], "solar": ["秋季", "立冬"], "calories": 90, "protein": 1, "fat": 0, "carbs": 22},
    {"name": "银耳莲子羹", "crowd": ["女性", "中老年"], "efficacy": ["润肺止咳", "美容养颜"], "solar": ["秋季", "冬季"], "calories": 140, "protein": 4, "fat": 0, "carbs": 30},
    {"name": "百合杏仁粥", "crowd": ["中老年", "白领"], "efficacy": ["润肺止咳", "安神助眠"], "solar": ["秋季", "白露", "寒露"], "calories": 180, "protein": 6, "fat": 3, "carbs": 32},
    {"name": "枇杷叶瘦肉汤", "crowd": ["中老年", "儿童"], "efficacy": ["润肺止咳"], "solar": ["春季", "秋季"], "calories": 250, "protein": 20, "fat": 12, "carbs": 5},
    {"name": "沙参玉竹老鸭汤", "crowd": ["中老年", "通用"], "efficacy": ["润肺止咳", "补气养血"], "solar": ["秋季", "处暑", "白露"], "calories": 380, "protein": 28, "fat": 25, "carbs": 8},
    {"name": "罗汉果菊花茶", "crowd": ["白领", "中老年"], "efficacy": ["润肺止咳", "清热解毒"], "solar": ["秋季", "夏季"], "calories": 15, "protein": 0, "fat": 0, "carbs": 4},
    {"name": "白萝卜蜂蜜饮", "crowd": ["儿童", "中老年"], "efficacy": ["润肺止咳"], "solar": ["冬季", "秋季"], "calories": 80, "protein": 1, "fat": 0, "carbs": 19},
    {"name": "南北杏猪肺汤", "crowd": ["中老年", "通用"], "efficacy": ["润肺止咳"], "solar": ["秋季", "冬季"], "calories": 220, "protein": 18, "fat": 14, "carbs": 6},
    
    # 补血类
    {"name": "当归红枣乌鸡汤", "crowd": ["女性", "中老年"], "efficacy": ["补气养血"], "solar": ["冬季", "秋季"], "calories": 320, "protein": 28, "fat": 16, "carbs": 10},
    {"name": "阿胶红糖粥", "crowd": ["女性"], "efficacy": ["补气养血", "美容养颜"], "solar": ["冬季", "秋季"], "calories": 280, "protein": 6, "fat": 2, "carbs": 58},
    {"name": "枸杞桂圆红枣茶", "crowd": ["女性", "中老年", "白领"], "efficacy": ["补气养血", "安神助眠"], "solar": ["四季"], "calories": 120, "protein": 2, "fat": 0, "carbs": 28},
    {"name": "花生红衣猪蹄汤", "crowd": ["女性", "中老年"], "efficacy": ["补气养血"], "solar": ["冬季", "秋季"], "calories": 450, "protein": 32, "fat": 30, "carbs": 12},
    {"name": "四物汤", "crowd": ["女性"], "efficacy": ["补气养血"], "solar": ["秋季", "冬季"], "calories": 80, "protein": 4, "fat": 1, "carbs": 14},
    {"name": "猪肝菠菜汤", "crowd": ["女性", "儿童", "中老年"], "efficacy": ["补气养血"], "solar": ["春季", "秋季"], "calories": 180, "protein": 22, "fat": 8, "carbs": 8},
    {"name": "黑芝麻糊", "crowd": ["中老年", "女性", "通用"], "efficacy": ["补气养血", "美容养颜"], "solar": ["冬季", "秋季"], "calories": 240, "protein": 8, "fat": 12, "carbs": 28},
    {"name": "桂圆莲子羹", "crowd": ["女性", "中老年"], "efficacy": ["补气养血", "安神助眠"], "solar": ["秋季", "冬季"], "calories": 200, "protein": 5, "fat": 1, "carbs": 42},
    {"name": "红豆薏米补血粥", "crowd": ["女性", "中老年"], "efficacy": ["补气养血", "祛湿排毒"], "solar": ["春季", "夏季"], "calories": 210, "protein": 7, "fat": 2, "carbs": 40},
    
    # 安神助眠类
    {"name": "酸枣仁安神茶", "crowd": ["中老年", "白领", "女性"], "efficacy": ["安神助眠"], "solar": ["秋季", "冬季"], "calories": 25, "protein": 1, "fat": 0, "carbs": 5},
    {"name": "柏子仁粥", "crowd": ["中老年", "白领"], "efficacy": ["安神助眠"], "solar": ["四季"], "calories": 170, "protein": 5, "fat": 2, "carbs": 32},
    {"name": "百合麦冬汤", "crowd": ["中老年", "女性"], "efficacy": ["安神助眠", "润肺止咳"], "solar": ["秋季", "夏季"], "calories": 60, "protein": 2, "fat": 0, "carbs": 12},
    {"name": "龙眼肉粥", "crowd": ["中老年", "女性"], "efficacy": ["安神助眠", "补气养血"], "solar": ["冬季", "秋季"], "calories": 220, "protein": 5, "fat": 1, "carbs": 48},
    {"name": "五味子茶", "crowd": ["中老年", "白领"], "efficacy": ["安神助眠"], "solar": ["秋季", "冬季"], "calories": 10, "protein": 0, "fat": 0, "carbs": 2},
    {"name": "远志莲子汤", "crowd": ["中老年", "通用"], "efficacy": ["安神助眠", "健脾养胃"], "solar": ["四季"], "calories": 80, "protein": 3, "fat": 0, "carbs": 16},
    {"name": "灵芝孢子粉饮", "crowd": ["中老年", "白领"], "efficacy": ["安神助眠", "增强免疫"], "solar": ["秋季", "冬季"], "calories": 30, "protein": 2, "fat": 1, "carbs": 4},
    
    # 美容养颜类
    {"name": "桃胶银耳羹", "crowd": ["女性"], "efficacy": ["美容养颜"], "solar": ["秋季", "冬季"], "calories": 150, "protein": 3, "fat": 0, "carbs": 35},
    {"name": "燕窝炖雪梨", "crowd": ["女性", "中老年"], "efficacy": ["美容养颜", "润肺止咳"], "solar": ["秋季", "冬季"], "calories": 120, "protein": 8, "fat": 0, "carbs": 22},
    {"name": "玫瑰花茶", "crowd": ["女性", "白领"], "efficacy": ["美容养颜"], "solar": ["春季", "夏季"], "calories": 5, "protein": 0, "fat": 0, "carbs": 1},
    {"name": "木瓜炖雪蛤", "crowd": ["女性"], "efficacy": ["美容养颜"], "solar": ["秋季", "冬季"], "calories": 180, "protein": 12, "fat": 8, "carbs": 18},
    {"name": "蜂蜜柠檬水", "crowd": ["女性", "通用"], "efficacy": ["美容养颜", "清热解毒"], "solar": ["夏季", "春季"], "calories": 60, "protein": 0, "fat": 0, "carbs": 16},
    {"name": "紫薯银耳羹", "crowd": ["女性", "中老年"], "efficacy": ["美容养颜", "健脾养胃"], "solar": ["秋季", "冬季"], "calories": 160, "protein": 4, "fat": 0, "carbs": 36},
    {"name": "胶原蛋白汤", "crowd": ["女性"], "efficacy": ["美容养颜"], "solar": ["冬季", "秋季"], "calories": 200, "protein": 18, "fat": 10, "carbs": 8},
    
    # 清热解毒类
    {"name": "绿豆汤", "crowd": ["通用", "儿童", "中老年"], "efficacy": ["清热解毒"], "solar": ["夏季", "小暑", "大暑"], "calories": 120, "protein": 6, "fat": 0, "carbs": 24},
    {"name": "苦瓜排骨汤", "crowd": ["中老年", "通用"], "efficacy": ["清热解毒", "降压降脂"], "solar": ["夏季", "秋季"], "calories": 280, "protein": 22, "fat": 16, "carbs": 8},
    {"name": "金银花菊花茶", "crowd": ["白领", "通用"], "efficacy": ["清热解毒"], "solar": ["夏季", "秋季"], "calories": 10, "protein": 0, "fat": 0, "carbs": 2},
    {"name": "冬瓜薏米汤", "crowd": ["中老年", "女性"], "efficacy": ["清热解毒", "祛湿排毒"], "solar": ["夏季", "秋季"], "calories": 80, "protein": 3, "fat": 0, "carbs": 16},
    {"name": "蒲公英茶", "crowd": ["中老年", "通用"], "efficacy": ["清热解毒"], "solar": ["春季", "夏季"], "calories": 5, "protein": 0, "fat": 0, "carbs": 1},
    {"name": "莲藕排骨汤", "crowd": ["中老年", "儿童", "通用"], "efficacy": ["清热解毒", "健脾养胃"], "solar": ["秋季", "冬季"], "calories": 320, "protein": 24, "fat": 18, "carbs": 12},
    
    # 降压降脂类
    {"name": "芹菜汁", "crowd": ["中老年", "白领"], "efficacy": ["降压降脂"], "solar": ["春季", "夏季"], "calories": 35, "protein": 2, "fat": 0, "carbs": 7},
    {"name": "山楂荷叶茶", "crowd": ["中老年", "通用"], "efficacy": ["降压降脂"], "solar": ["夏季", "秋季"], "calories": 20, "protein": 0, "fat": 0, "carbs": 5},
    {"name": "决明子茶", "crowd": ["中老年", "白领"], "efficacy": ["降压降脂", "清热解毒"], "solar": ["秋季", "冬季"], "calories": 15, "protein": 1, "fat": 0, "carbs": 3},
    {"name": "黑木耳红枣汤", "crowd": ["中老年", "女性"], "efficacy": ["降压降脂", "补气养血"], "solar": ["秋季", "冬季"], "calories": 140, "protein": 5, "fat": 1, "carbs": 28},
    {"name": "海带豆腐汤", "crowd": ["中老年", "通用"], "efficacy": ["降压降脂"], "solar": ["四季"], "calories": 120, "protein": 10, "fat": 4, "carbs": 10},
    {"name": "燕麦粥", "crowd": ["中老年", "白领", "通用"], "efficacy": ["降压降脂", "健脾养胃"], "solar": ["四季"], "calories": 150, "protein": 6, "fat": 3, "carbs": 26},
    
    # 增强免疫类
    {"name": "黄芪党参鸡汤", "crowd": ["中老年", "通用"], "efficacy": ["增强免疫", "补气养血"], "solar": ["冬季", "秋季"], "calories": 340, "protein": 30, "fat": 18, "carbs": 8},
    {"name": "虫草花炖排骨", "crowd": ["中老年", "通用"], "efficacy": ["增强免疫"], "solar": ["秋季", "冬季"], "calories": 380, "protein": 28, "fat": 22, "carbs": 10},
    {"name": "灵芝煲鸡汤", "crowd": ["中老年", "通用"], "efficacy": ["增强免疫", "安神助眠"], "solar": ["冬季", "秋季"], "calories": 360, "protein": 32, "fat": 20, "carbs": 6},
    {"name": "人参枸杞茶", "crowd": ["中老年", "白领"], "efficacy": ["增强免疫", "补气养血"], "solar": ["冬季", "秋季"], "calories": 40, "protein": 2, "fat": 0, "carbs": 8},
    {"name": "花胶炖鸡汤", "crowd": ["中老年", "女性"], "efficacy": ["增强免疫", "美容养颜"], "solar": ["冬季", "秋季"], "calories": 420, "protein": 35, "fat": 24, "carbs": 8},
    {"name": "牛蒡排骨汤", "crowd": ["中老年", "通用"], "efficacy": ["增强免疫", "清热解毒"], "solar": ["春季", "秋季"], "calories": 340, "protein": 26, "fat": 20, "carbs": 12},
    
    # 祛湿排毒类
    {"name": "红豆薏米水", "crowd": ["女性", "中老年", "通用"], "efficacy": ["祛湿排毒"], "solar": ["夏季", "秋季"], "calories": 90, "protein": 4, "fat": 0, "carbs": 18},
    {"name": "茯苓白术汤", "crowd": ["中老年", "通用"], "efficacy": ["祛湿排毒", "健脾养胃"], "solar": ["夏季", "秋季"], "calories": 60, "protein": 2, "fat": 0, "carbs": 12},
    {"name": "冬瓜荷叶汤", "crowd": ["中老年", "女性"], "efficacy": ["祛湿排毒", "清热解毒"], "solar": ["夏季", "秋季"], "calories": 50, "protein": 2, "fat": 0, "carbs": 10},
    {"name": "玉米须茶", "crowd": ["中老年", "通用"], "efficacy": ["祛湿排毒", "降压降脂"], "solar": ["夏季", "秋季"], "calories": 5, "protein": 0, "fat": 0, "carbs": 1},
    {"name": "赤小豆鲫鱼汤", "crowd": ["中老年", "通用"], "efficacy": ["祛湿排毒"], "solar": ["春季", "夏季"], "calories": 280, "protein": 28, "fat": 14, "carbs": 6},
    {"name": "土茯苓煲龟", "crowd": ["中老年", "通用"], "efficacy": ["祛湿排毒", "清热解毒"], "solar": ["夏季", "秋季"], "calories": 320, "protein": 35, "fat": 16, "carbs": 4},
    
    # 补肾壮阳类
    {"name": "杜仲猪腰汤", "crowd": ["中老年", "男性"], "efficacy": ["补肾壮阳"], "solar": ["冬季", "秋季"], "calories": 380, "protein": 30, "fat": 24, "carbs": 6},
    {"name": "枸杞羊肉汤", "crowd": ["中老年", "男性"], "efficacy": ["补肾壮阳", "补气养血"], "solar": ["冬季", "立冬", "冬至"], "calories": 450, "protein": 35, "fat": 30, "carbs": 8},
    {"name": "韭菜炒虾仁", "crowd": ["中老年", "男性", "通用"], "efficacy": ["补肾壮阳"], "solar": ["春季", "冬季"], "calories": 280, "protein": 28, "fat": 16, "carbs": 8},
    {"name": "核桃仁粥", "crowd": ["中老年", "通用"], "efficacy": ["补肾壮阳", "安神助眠"], "solar": ["冬季", "秋季"], "calories": 260, "protein": 10, "fat": 18, "carbs": 16},
    {"name": "海参小米粥", "crowd": ["中老年", "通用"], "efficacy": ["补肾壮阳", "增强免疫"], "solar": ["冬季", "秋季"], "calories": 320, "protein": 22, "fat": 12, "carbs": 30},
    {"name": "肉苁蓉炖羊肉", "crowd": ["中老年", "男性"], "efficacy": ["补肾壮阳", "补气养血"], "solar": ["冬季", "大寒", "小寒"], "calories": 480, "protein": 38, "fat": 32, "carbs": 6},
]

# 食材映射
INGREDIENTS_MAP = {
    "山药小米粥": [("山药", "100g"), ("小米", "80g"), ("红枣", "5颗"), ("冰糖", "适量")],
    "南瓜红枣粥": [("南瓜", "200g"), ("红枣", "8颗"), ("大米", "100g"), ("红糖", "适量")],
    "猴头菇炖鸡汤": [("猴头菇", "50g"), ("土鸡", "半只"), ("枸杞", "10g"), ("姜片", "3片")],
    "莲子百合粥": [("莲子", "30g"), ("百合", "20g"), ("大米", "100g"), ("冰糖", "适量")],
    "茯苓山药排骨汤": [("茯苓", "15g"), ("山药", "150g"), ("排骨", "300g"), ("红枣", "5颗")],
    "陈皮瘦肉粥": [("陈皮", "5g"), ("瘦肉", "100g"), ("大米", "100g"), ("姜丝", "少许")],
    "芡实薏米粥": [("芡实", "30g"), ("薏米", "30g"), ("大米", "80g"), ("红枣", "5颗")],
    "生姜红糖暖胃汤": [("生姜", "30g"), ("红糖", "30g"), ("红枣", "6颗"), ("水", "500ml")],
    "川贝雪梨汤": [("川贝", "5g"), ("雪梨", "1个"), ("冰糖", "适量"), ("枸杞", "少许")],
    "银耳莲子羹": [("银耳", "20g"), ("莲子", "30g"), ("冰糖", "适量"), ("枸杞", "10g")],
    "百合杏仁粥": [("百合", "30g"), ("杏仁", "15g"), ("大米", "100g"), ("冰糖", "适量")],
    "枇杷叶瘦肉汤": [("枇杷叶", "10g"), ("瘦肉", "200g"), ("蜜枣", "2颗"), ("姜片", "3片")],
    "沙参玉竹老鸭汤": [("沙参", "15g"), ("玉竹", "15g"), ("老鸭", "半只"), ("枸杞", "10g")],
    "罗汉果菊花茶": [("罗汉果", "1/4个"), ("菊花", "10g"), ("枸杞", "5g"), ("冰糖", "适量")],
    "白萝卜蜂蜜饮": [("白萝卜", "200g"), ("蜂蜜", "2勺"), ("水", "300ml")],
    "南北杏猪肺汤": [("南杏", "10g"), ("北杏", "5g"), ("猪肺", "300g"), ("蜜枣", "2颗")],
    "当归红枣乌鸡汤": [("当归", "10g"), ("红枣", "8颗"), ("乌鸡", "半只"), ("枸杞", "10g")],
    "阿胶红糖粥": [("阿胶", "10g"), ("红糖", "30g"), ("大米", "100g"), ("红枣", "6颗")],
    "枸杞桂圆红枣茶": [("枸杞", "15g"), ("桂圆", "10颗"), ("红枣", "5颗"), ("红糖", "适量")],
    "花生红衣猪蹄汤": [("花生", "100g"), ("猪蹄", "1只"), ("红枣", "8颗"), ("姜片", "3片")],
    "四物汤": [("当归", "10g"), ("川芎", "8g"), ("白芍", "12g"), ("熟地", "12g")],
    "猪肝菠菜汤": [("猪肝", "200g"), ("菠菜", "150g"), ("姜丝", "少许"), ("枸杞", "10g")],
    "黑芝麻糊": [("黑芝麻", "50g"), ("糯米粉", "30g"), ("冰糖", "适量"), ("水", "400ml")],
    "桂圆莲子羹": [("桂圆", "20g"), ("莲子", "30g"), ("银耳", "15g"), ("冰糖", "适量")],
    "红豆薏米补血粥": [("红豆", "50g"), ("薏米", "30g"), ("红枣", "6颗"), ("红糖", "适量")],
    "酸枣仁安神茶": [("酸枣仁", "15g"), ("茯苓", "10g"), ("甘草", "3g"), ("水", "500ml")],
    "柏子仁粥": [("柏子仁", "15g"), ("大米", "100g"), ("蜂蜜", "适量")],
    "百合麦冬汤": [("百合", "30g"), ("麦冬", "15g"), ("冰糖", "适量")],
    "龙眼肉粥": [("龙眼肉", "30g"), ("大米", "100g"), ("红枣", "5颗")],
    "五味子茶": [("五味子", "10g"), ("枸杞", "10g"), ("水", "500ml")],
    "远志莲子汤": [("远志", "10g"), ("莲子", "30g"), ("冰糖", "适量")],
    "灵芝孢子粉饮": [("灵芝孢子粉", "3g"), ("蜂蜜", "适量"), ("温水", "200ml")],
    "桃胶银耳羹": [("桃胶", "15g"), ("银耳", "20g"), ("冰糖", "适量"), ("枸杞", "10g")],
    "燕窝炖雪梨": [("燕窝", "5g"), ("雪梨", "1个"), ("冰糖", "适量"), ("枸杞", "少许")],
    "玫瑰花茶": [("玫瑰花", "10g"), ("冰糖", "适量"), ("水", "500ml")],
    "木瓜炖雪蛤": [("木瓜", "半个"), ("雪蛤", "5g"), ("冰糖", "适量"), ("牛奶", "200ml")],
    "蜂蜜柠檬水": [("柠檬", "半个"), ("蜂蜜", "2勺"), ("温水", "300ml")],
    "紫薯银耳羹": [("紫薯", "150g"), ("银耳", "20g"), ("冰糖", "适量")],
    "胶原蛋白汤": [("猪蹄", "1只"), ("鸡爪", "200g"), ("红枣", "8颗"), ("姜片", "3片")],
    "绿豆汤": [("绿豆", "100g"), ("冰糖", "适量"), ("水", "800ml")],
    "苦瓜排骨汤": [("苦瓜", "200g"), ("排骨", "300g"), ("黄豆", "50g"), ("姜片", "3片")],
    "金银花菊花茶": [("金银花", "10g"), ("菊花", "10g"), ("冰糖", "适量")],
    "冬瓜薏米汤": [("冬瓜", "300g"), ("薏米", "50g"), ("排骨", "200g"), ("姜片", "2片")],
    "蒲公英茶": [("蒲公英", "15g"), ("冰糖", "适量"), ("水", "500ml")],
    "莲藕排骨汤": [("莲藕", "300g"), ("排骨", "300g"), ("红枣", "6颗"), ("枸杞", "10g")],
    "芹菜汁": [("芹菜", "200g"), ("苹果", "1个"), ("蜂蜜", "适量"), ("水", "200ml")],
    "山楂荷叶茶": [("山楂", "15g"), ("荷叶", "10g"), ("冰糖", "适量")],
    "决明子茶": [("决明子", "15g"), ("菊花", "10g"), ("枸杞", "10g")],
    "黑木耳红枣汤": [("黑木耳", "30g"), ("红枣", "10颗"), ("冰糖", "适量")],
    "海带豆腐汤": [("海带", "100g"), ("豆腐", "200g"), ("虾皮", "10g"), ("姜丝", "少许")],
    "燕麦粥": [("燕麦", "80g"), ("牛奶", "250ml"), ("蜂蜜", "适量"), ("坚果", "少许")],
    "黄芪党参鸡汤": [("黄芪", "15g"), ("党参", "15g"), ("土鸡", "半只"), ("红枣", "8颗")],
    "虫草花炖排骨": [("虫草花", "20g"), ("排骨", "400g"), ("枸杞", "10g"), ("姜片", "3片")],
    "灵芝煲鸡汤": [("灵芝", "10g"), ("土鸡", "半只"), ("红枣", "8颗"), ("枸杞", "10g")],
    "人参枸杞茶": [("人参", "5g"), ("枸杞", "15g"), ("红枣", "5颗"), ("冰糖", "适量")],
    "花胶炖鸡汤": [("花胶", "20g"), ("土鸡", "半只"), ("红枣", "8颗"), ("枸杞", "10g")],
    "牛蒡排骨汤": [("牛蒡", "200g"), ("排骨", "300g"), ("胡萝卜", "1根"), ("姜片", "3片")],
    "红豆薏米水": [("红豆", "50g"), ("薏米", "50g"), ("冰糖", "适量")],
    "茯苓白术汤": [("茯苓", "15g"), ("白术", "15g"), ("红枣", "6颗"), ("冰糖", "适量")],
    "冬瓜荷叶汤": [("冬瓜", "400g"), ("荷叶", "10g"), ("薏米", "30g")],
    "玉米须茶": [("玉米须", "30g"), ("水", "500ml")],
    "赤小豆鲫鱼汤": [("赤小豆", "50g"), ("鲫鱼", "1条"), ("姜片", "3片"), ("陈皮", "5g")],
    "土茯苓煲龟": [("土茯苓", "30g"), ("草龟", "1只"), ("瘦肉", "200g"), ("姜片", "3片")],
    "杜仲猪腰汤": [("杜仲", "15g"), ("猪腰", "2个"), ("枸杞", "10g"), ("姜片", "3片")],
    "枸杞羊肉汤": [("枸杞", "20g"), ("羊肉", "500g"), ("当归", "10g"), ("姜片", "5片")],
    "韭菜炒虾仁": [("韭菜", "200g"), ("虾仁", "150g"), ("姜丝", "少许"), ("料酒", "适量")],
    "核桃仁粥": [("核桃仁", "30g"), ("大米", "100g"), ("冰糖", "适量")],
    "海参小米粥": [("海参", "2只"), ("小米", "100g"), ("姜丝", "少许"), ("葱花", "少许")],
    "肉苁蓉炖羊肉": [("肉苁蓉", "15g"), ("羊肉", "500g"), ("枸杞", "15g"), ("姜片", "5片")],
}

# 制作步骤模板
STEP_TEMPLATES = [
    "将食材清洗干净，备用",
    "将主料切成适当大小的块状",
    "锅中加入适量清水，大火烧开",
    "放入主料，转小火慢炖30分钟",
    "加入辅料，继续炖煮20分钟",
    "最后加入调味料，搅拌均匀",
    "出锅前撒上葱花或香菜点缀",
    "盛入碗中，趁热食用效果更佳",
    "可根据个人口味调整甜度或咸度",
    "建议空腹或饭前食用，吸收更好"
]

# 内容数据源
CONTENT_SOURCES = [
    {"source": "wechat_video", "author": "养生达人小王"},
    {"source": "wechat_video", "author": "中医养生堂"},
    {"source": "wechat_video", "author": "食疗养生专家"},
    {"source": "wechat_article", "author": "健康生活指南"},
    {"source": "wechat_article", "author": "中医食疗大全"},
    {"source": "wechat_article", "author": "养生食谱精选"},
    {"source": "douyin", "author": "养生小姐姐"},
    {"source": "douyin", "author": "老中医食疗"},
    {"source": "douyin", "author": "健康美食家"},
    {"source": "self", "author": "Health-Diet官方"},
]

CONTENT_TITLES = [
    "春季养生必吃的10种食材",
    "夏季清热解暑食疗方推荐",
    "秋季润肺止咳的食疗秘方",
    "冬季进补养生汤谱大全",
    "白领熬夜党必备养生食谱",
    "中老年人的养胃食疗方案",
    "女性美容养颜食疗方",
    "儿童健脾养胃营养餐",
    "节气养生食疗指南",
    "祛湿排毒食疗方推荐",
    "补气养血的食疗秘方",
    "安神助眠的食疗方案",
    "降压降脂食疗食谱",
    "增强免疫力的食疗方",
    "补肾壮阳食疗推荐",
    "养胃护胃食疗大全",
    "润肺止咳食疗秘方",
    "清热解毒食疗方案",
    "美容养颜食疗食谱",
    "四季养生食疗指南",
    "办公室养生茶饮推荐",
    "睡前助眠食疗方",
    "早餐养生粥谱推荐",
    "晚餐轻食养生方案",
    "产后恢复食疗方",
    "更年期养生食疗",
    "学生健脑食疗方",
    "运动员营养食疗",
    "减肥瘦身食疗方",
    "增肌健身食疗推荐"
]

# 评论内容模板
COMMENT_TEMPLATES = [
    "真的很有效，坚持喝了一周感觉好多了！",
    "味道不错，做法也很简单，推荐给大家",
    "给家人做了这个，都说很好喝",
    "按照步骤做的，效果很明显",
    "这个配方太棒了，收藏了",
    "已经收藏，准备明天试试",
    "请问可以天天喝吗？",
    "孕妇可以喝这个吗？",
    "糖尿病患者能喝吗？",
    "孩子很喜欢喝，谢谢分享",
    "食材容易买到，很方便",
    "做法详细，新手也能学会",
    "喝了一段时间，感觉气色好了很多",
    "这个汤真的很滋补",
    "推荐给朋友了，都说不错",
    "请问可以用其他食材代替吗？",
    "火候要掌握多久啊？",
    "第一次做就成功了，开心",
    "这个配方很专业，点赞",
    "希望能出更多类似的食谱",
    "已经加入收藏夹了",
    "每天一碗，身体棒棒的",
    "老人小孩都适合喝",
    "冬天喝这个太舒服了",
    "夏天喝这个很解暑",
    "味道清淡不油腻，喜欢",
    "营养价值很高",
    "做法简单快捷，适合上班族",
    "坚持喝了一个月，效果明显",
    "感谢分享这么好的食谱",
]

# 用户昵称和头像
USER_NICKNAMES = [
    "养生达人", "健康小卫士", "食疗爱好者", "美食家小王", "中医粉",
    "养生小仙女", "健康生活方式", "食疗养生专家", "美食探索者", "养生老司机",
    "健康生活家", "食疗小能手", "美食爱好者", "养生小白", "健康达人",
    "食疗研究者", "美食博主", "养生控", "健康追求者", "食疗实践者",
    "养生爱好者", "健康守护者", "食疗达人", "美食猎人", "养生学徒",
    "健康倡导者", "食疗探索者", "美食品鉴师", "养生研究员", "健康顾问"
]

AVATAR_URLS = [
    "https://api.dicebear.com/7.x/avataaars/svg?seed=1",
    "https://api.dicebear.com/7.x/avataaars/svg?seed=2",
    "https://api.dicebear.com/7.x/avataaars/svg?seed=3",
    "https://api.dicebear.com/7.x/avataaars/svg?seed=4",
    "https://api.dicebear.com/7.x/avataaars/svg?seed=5",
]

# ============ 数据生成函数 ============

def generate_recipe_descriptions(recipe_name: str, efficacy: List[str]) -> Dict[str, str]:
    """生成配方描述"""
    efficacy_str = "、".join(efficacy)
    return {
        "zh_cn": f"{recipe_name}是一道传统的食疗养生佳品，具有{efficacy_str}的功效。选用优质食材，精心熬制而成，适合日常保健调理。",
        "zh_tw": f"{recipe_name}是一道傳統的食療養生佳品，具有{efficacy_str}的功效。選用優質食材，精心熬製而成，適合日常保健調理。",
        "en": f"{recipe_name} is a traditional therapeutic recipe with benefits of {efficacy_str}. Made with quality ingredients, perfect for daily wellness."
    }

def generate_steps(recipe_name: str) -> List[Dict[str, Any]]:
    """生成制作步骤"""
    base_steps = [
        "准备所有食材，清洗干净",
        f"将{recipe_name[:2]}主料处理干净，切成适当大小",
        "锅中加入适量清水，大火烧开",
        "放入主料，转小火慢炖",
        "加入辅料，继续炖煮",
        "调味出锅，趁热食用"
    ]
    steps = []
    for i, desc in enumerate(base_steps, 1):
        steps.append({
            "step_order": i,
            "description_zh_cn": desc,
            "description_zh_tw": desc,
            "description_en": f"Step {i}: {desc}",
            "image": f"https://loremflickr.com/400/300/cooking,step?lock={recipe_name}_{i}"
        })
    return steps

def generate_sql() -> str:
    """生成完整的SQL插入语句"""
    sql_lines = []
    sql_lines.append("-- Health-Diet 食疗养生小程序 - 测试数据生成脚本")
    sql_lines.append(f"-- 生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append("-- 注意: 执行前请确保数据库已初始化")
    sql_lines.append("")
    sql_lines.append("BEGIN;")
    sql_lines.append("")
    
    # 1. 生成用户数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 1. 用户数据 (20个测试用户)")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    user_ids = []
    for i in range(1, 21):
        user_id = i
        user_ids.append(user_id)
        nickname = random.choice(USER_NICKNAMES) + str(i)
        avatar = random.choice(AVATAR_URLS) + f"&user={i}"
        wx_openid = f"wx_{random.randint(10000000, 99999999)}" if random.random() > 0.3 else None
        dy_openid = f"dy_{random.randint(10000000, 99999999)}" if random.random() > 0.5 else None
        phone = f"138{random.randint(10000000, 99999999)}" if random.random() > 0.4 else None
        language = random.choice(['zh-CN', 'zh-TW', 'en'])
        status = 1
        created_at = (datetime.now() - timedelta(days=random.randint(1, 90))).strftime('%Y-%m-%d %H:%M:%S')
        
        sql_lines.append(f"INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)")
        sql_lines.append(f"VALUES ({user_id}, {f"'{wx_openid}'" if wx_openid else 'NULL'}, {f"'{dy_openid}'" if dy_openid else 'NULL'}, '{nickname}', '{avatar}', {f"'{phone}'" if phone else 'NULL'}, '{language}', {status}, '{created_at}', '{created_at}');")
    
    sql_lines.append("")
    sql_lines.append(f"SELECT '用户数据插入完成: 20条' AS message;")
    sql_lines.append("")
    
    # 2. 生成配方数据
    sql_lines.append("-- ============================================")
    sql_lines.append(f"-- 2. 配方数据 ({len(RECIPES_DATA)}条食疗配方)")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    recipe_ids = []
    for i, recipe in enumerate(RECIPES_DATA, 1):
        recipe_id = i
        recipe_ids.append(recipe_id)
        name = recipe["name"]
        descriptions = generate_recipe_descriptions(name, recipe["efficacy"])
        cover_image = f"https://loremflickr.com/600/400/food,recipe?lock={recipe_id}"
        video_url = f"/videos/recipes/{name}.mp4" if random.random() > 0.5 else None
        video_duration = random.randint(60, 300) if video_url else None
        crowd_tags = json.dumps(recipe["crowd"], ensure_ascii=False)
        efficacy_tags = json.dumps(recipe["efficacy"], ensure_ascii=False)
        solar_term_tags = json.dumps(recipe["solar"], ensure_ascii=False)
        nutrition = json.dumps({
            "calories": recipe["calories"],
            "protein": recipe["protein"],
            "fat": recipe["fat"],
            "carbs": recipe["carbs"]
        }, ensure_ascii=False)
        view_count = random.randint(100, 5000)
        favorite_count = random.randint(10, 500)
        comment_count = random.randint(5, 100)
        rating = round(random.uniform(4.0, 5.0), 1)
        status = 1
        created_at = (datetime.now() - timedelta(days=random.randint(1, 180))).strftime('%Y-%m-%d %H:%M:%S')
        
        sql_lines.append(f"INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,")
        sql_lines.append(f"    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,")
        sql_lines.append(f"    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)")
        sql_lines.append(f"VALUES ({recipe_id}, '{name}', '{name}', '{name}', '{descriptions['zh_cn']}', '{descriptions['zh_tw']}', '{descriptions['en']}',")
        sql_lines.append(f"    '{cover_image}', {f"'{video_url}'" if video_url else 'NULL'}, {video_duration if video_duration else 'NULL'}, '{crowd_tags}', '{efficacy_tags}', '{solar_term_tags}', '{nutrition}',")
        sql_lines.append(f"    {view_count}, {favorite_count}, {comment_count}, {rating}, {status}, '{created_at}', '{created_at}');")
    
    sql_lines.append("")
    sql_lines.append(f"SELECT '配方数据插入完成: {len(RECIPES_DATA)}条' AS message;")
    sql_lines.append("")
    
    # 3. 生成食材数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 3. 食材数据")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    ingredient_id = 1
    for recipe_id, recipe in enumerate(RECIPES_DATA, 1):
        name = recipe["name"]
        ingredients = INGREDIENTS_MAP.get(name, [("主料", "适量"), ("辅料", "少许")])
        
        for sort_order, (ing_name, amount) in enumerate(ingredients, 0):
            sql_lines.append(f"INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)")
            sql_lines.append(f"VALUES ({ingredient_id}, {recipe_id}, '{ing_name}', '{ing_name}', '{ing_name}', '{amount}', 'https://loremflickr.com/200/200/food,ingredient?lock={ingredient_id}', {sort_order});")
            ingredient_id += 1
    
    total_ingredients = ingredient_id - 1
    sql_lines.append("")
    sql_lines.append(f"SELECT '食材数据插入完成: {total_ingredients}条' AS message;")
    sql_lines.append("")
    
    # 4. 生成步骤数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 4. 制作步骤数据")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    step_id = 1
    for recipe_id, recipe in enumerate(RECIPES_DATA, 1):
        name = recipe["name"]
        steps = generate_steps(name)
        
        for step in steps:
            sql_lines.append(f"INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)")
            sql_lines.append(f"VALUES ({step_id}, {recipe_id}, {step['step_order']}, '{step['description_zh_cn']}', '{step['description_zh_tw']}', '{step['description_en']}', '{step['image']}');")
            step_id += 1
    
    total_steps = step_id - 1
    sql_lines.append("")
    sql_lines.append(f"SELECT '步骤数据插入完成: {total_steps}条' AS message;")
    sql_lines.append("")
    
    # 5. 生成内容数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 5. 内容数据 (30条)")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    content_ids = []
    for i in range(1, 31):
        content_id = i
        content_ids.append(content_id)
        source_info = random.choice(CONTENT_SOURCES)
        title = random.choice(CONTENT_TITLES)
        source = source_info["source"]
        source_url = f"https://example.com/content/{content_id}"
        cover_image = f"https://loremflickr.com/600/400/health,lifestyle?lock={content_id}"
        author = source_info["author"]
        content_type = "video" if source in ["wechat_video", "douyin"] else "article"
        tags = json.dumps(random.sample(["养生", "食疗", "健康", "美食", "中医", "节气", "保健"], 3), ensure_ascii=False)
        view_count = random.randint(500, 10000)
        status = 1
        published_at = (datetime.now() - timedelta(days=random.randint(1, 60))).strftime('%Y-%m-%d %H:%M:%S')
        created_at = published_at
        
        sql_lines.append(f"INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)")
        sql_lines.append(f"VALUES ({content_id}, '{title}', '{source}', '{source_url}', '{cover_image}', '{author}', '{content_type}', '{tags}', {view_count}, {status}, '{published_at}', '{created_at}');")
    
    sql_lines.append("")
    sql_lines.append(f"SELECT '内容数据插入完成: 30条' AS message;")
    sql_lines.append("")
    
    # 6. 生成收藏数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 6. 收藏数据")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    favorite_id = 1
    for user_id in user_ids:
        # 每个用户随机收藏5-15个配方
        num_favorites = random.randint(5, 15)
        favorite_recipes = random.sample(recipe_ids, min(num_favorites, len(recipe_ids)))
        for recipe_id in favorite_recipes:
            created_at = (datetime.now() - timedelta(days=random.randint(1, 60))).strftime('%Y-%m-%d %H:%M:%S')
            sql_lines.append(f"INSERT INTO favorites (id, user_id, recipe_id, created_at)")
            sql_lines.append(f"VALUES ({favorite_id}, {user_id}, {recipe_id}, '{created_at}');")
            favorite_id += 1
    
    total_favorites = favorite_id - 1
    sql_lines.append("")
    sql_lines.append(f"SELECT '收藏数据插入完成: {total_favorites}条' AS message;")
    sql_lines.append("")
    
    # 7. 生成浏览历史数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 7. 浏览历史数据")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    history_id = 1
    for user_id in user_ids:
        # 每个用户随机浏览10-30个配方
        num_history = random.randint(10, 30)
        history_recipes = random.sample(recipe_ids, min(num_history, len(recipe_ids)))
        for recipe_id in history_recipes:
            viewed_at = (datetime.now() - timedelta(days=random.randint(1, 30), hours=random.randint(0, 23))).strftime('%Y-%m-%d %H:%M:%S')
            sql_lines.append(f"INSERT INTO user_history (id, user_id, recipe_id, viewed_at)")
            sql_lines.append(f"VALUES ({history_id}, {user_id}, {recipe_id}, '{viewed_at}')")
            sql_lines.append(f"ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '{viewed_at}';")
            history_id += 1
    
    total_history = history_id - 1
    sql_lines.append("")
    sql_lines.append(f"SELECT '浏览历史数据插入完成: {total_history}条' AS message;")
    sql_lines.append("")
    
    # 8. 生成评论数据
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 8. 评论数据 (100+条)")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    
    comment_id = 1
    for recipe_id in recipe_ids:
        # 每个配方随机1-5条评论
        num_comments = random.randint(1, 5)
        for _ in range(num_comments):
            user_id = random.choice(user_ids)
            content = random.choice(COMMENT_TEMPLATES)
            rating = random.randint(3, 5)
            images = json.dumps([f"https://loremflickr.com/400/400/food,review?lock={comment_id}"] if random.random() > 0.8 else [], ensure_ascii=False)
            likes = random.randint(0, 50)
            reply_count = random.randint(0, 5)
            status = 1
            created_at = (datetime.now() - timedelta(days=random.randint(1, 90))).strftime('%Y-%m-%d %H:%M:%S')
            
            sql_lines.append(f"INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)")
            sql_lines.append(f"VALUES ({comment_id}, {recipe_id}, {user_id}, '{content}', {rating}, '{images}', {likes}, {reply_count}, {status}, '{created_at}');")
            comment_id += 1
    
    total_comments = comment_id - 1
    sql_lines.append("")
    sql_lines.append(f"SELECT '评论数据插入完成: {total_comments}条' AS message;")
    sql_lines.append("")
    
    # 提交事务
    sql_lines.append("COMMIT;")
    sql_lines.append("")
    
    # 数据统计
    sql_lines.append("-- ============================================")
    sql_lines.append("-- 数据统计")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    sql_lines.append("SELECT '数据填充完成！统计如下：' AS message;")
    sql_lines.append("SELECT COUNT(*) AS user_count FROM users;")
    sql_lines.append("SELECT COUNT(*) AS recipe_count FROM recipes;")
    sql_lines.append("SELECT COUNT(*) AS ingredient_count FROM recipe_ingredients;")
    sql_lines.append("SELECT COUNT(*) AS step_count FROM recipe_steps;")
    sql_lines.append("SELECT COUNT(*) AS content_count FROM contents;")
    sql_lines.append("SELECT COUNT(*) AS favorite_count FROM favorites;")
    sql_lines.append("SELECT COUNT(*) AS history_count FROM user_history;")
    sql_lines.append("SELECT COUNT(*) AS comment_count FROM comments;")
    
    return "\n".join(sql_lines)

def main():
    """主函数"""
    print("Health-Diet 食疗养生小程序 - 测试数据生成器")
    print("=" * 50)
    print(f"生成时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    sql_content = generate_sql()
    
    # 保存SQL文件
    output_file = "/Users/river/Documents/health-diet/database/scripts/seed_data.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"✅ SQL文件已生成: {output_file}")
    print()
    print("预计生成数据量:")
    print(f"  - 用户: 20条")
    print(f"  - 配方: {len(RECIPES_DATA)}条")
    print(f"  - 食材: ~{len(RECIPES_DATA) * 4}条")
    print(f"  - 步骤: ~{len(RECIPES_DATA) * 6}条")
    print(f"  - 内容: 30条")
    print(f"  - 收藏: ~{20 * 10}条")
    print(f"  - 浏览历史: ~{20 * 20}条")
    print(f"  - 评论: 100+条")
    print()
    print("执行方式:")
    print(f"  psql -U your_username -d health_diet -f {output_file}")

if __name__ == "__main__":
    main()
