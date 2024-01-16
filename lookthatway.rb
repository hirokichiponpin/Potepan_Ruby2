$result_janken = 0
$breakpoint = 0

def janken
        puts "最初はグー、ジャンケン・・・・"
        puts "※出す手(グー→0 チョキ→1 パー→2 戦わない→3)"
        hand_sign = gets.to_i

        if hand_sign == 3
            puts "対戦を終了します"
            exit
        end
        
        until hand_sign == 0 || hand_sign == 1 || hand_sign ==2
            puts "入力エラーです　再度入力してください"
            puts "※出す手(グー→0 チョキ→1 パー→2 戦わない→3)"
            hand_sign = gets.to_i

            if hand_sign == 3
                puts "対戦を終了します"
                exit
            end
        end
        
        hand = ["グー","チョキ","パー"]
        enemy_hand = rand(3)

        puts "----------"
        puts "ぽん！"
        puts "あなた → 『#{hand[hand_sign]}』を出しました"
        puts "相手　 → 『#{hand[enemy_hand]}』を出しました"
        puts "----------"

        if (hand_sign == 0 && enemy_hand == 2) || (hand_sign == 1 && enemy_hand == 0) || (hand_sign == 2 && enemy_hand == 1)
            $result_janken = 1
        elsif (hand_sign == 0 && enemy_hand == 1) || (hand_sign == 1 && enemy_hand == 2) || (hand_sign == 2 && enemy_hand == 0)
            $result_janken = 2
        else
            $result_janken = 3
        end

        # $result_janken 1→負け 2→勝ち 3→あいこ 
end

def lose_pattern
    puts "あっち向いて・・・・"
    puts "※向く方向(上→0 右→1 下→2 左→3 戦わない→4)"

    face_direction = gets.to_i

    if face_direction == 4
        puts "対戦を終了します"
        exit
    end

    until face_direction == 0 || face_direction == 1 || face_direction == 2 || face_direction == 3
        puts "入力エラーです　再度入力してください"
        puts "※向く方向(上→0 右→1 下→2 左→3 戦わない→4)"

        face_direction == gets.to_i

        if face_direction == 4
            puts "対戦を終了します"
            exit
        end
    end

    direction = ["上","右","下","左"]
    enemy_pointing = rand(4)

    puts "----------"
    puts "ほい！"
    puts "あなた → 『#{direction[face_direction]}』を向いています"
    puts "相手　 → 『#{direction[enemy_pointing]}』を指しています"
    puts "----------"    

    if face_direction == enemy_pointing
        puts "残念！あなたの負けです！"
        $breakpoint = 1
    else
        $result_janken = 0
    end
end

def win_pattern
    puts "あっち向いて・・・・"
    puts "※指す方向(上→0 右→1 下→2 左→3 戦わない→4)"

    pointing_direction = gets.to_i

    if pointing_direction == 4
        puts "対戦を終了します"
        exit
    end

    until pointing_direction == 0 || pointing_direction == 1 || pointing_direction == 2 || pointing_direction == 3
        puts "入力エラーです　再度入力してください"
        puts "※向く方向(上→0 右→1 下→2 左→3 戦わない→4)"
        pointing_direction = gets.to_i

        if pointing_direction == 4
            puts "対戦を終了します"
            exit
        end
    end

    direction = ["上","右","下","左"]
    enemy_face = rand(4)

    puts "----------"
    puts "ほい！"
    puts "あなた → 『#{direction[pointing_direction]}』を指しました"
    puts "相手　 → 『#{direction[enemy_face]}』を向いています"
    puts "----------"

    if pointing_direction == enemy_face
        puts "おめでとうございます！あなたの勝利です！"
        $breakpoint = 1
    else
        $result_janken = 0
    end
end

def draw_pattern
    puts "あいこで・・・・"

    puts "※出す手(グー→0 チョキ→1 パー→2 戦わない→3)"
    hand_sign = gets.to_i

    if hand_sign == 3
        puts "対戦を終了します"
        exit
    end
    
    until hand_sign == 0 || hand_sign == 1 || hand_sign ==2
        puts "入力エラーです　再度入力してください"
        puts "※出す手(グー→0 チョキ→1 パー→2 戦わない→3)"
        hand_sign = gets.to_i

        if hand_sign == 3
            puts "対戦を終了します"
            exit
        end
    end
    
    hand = ["グー","チョキ","パー"]
    enemy_hand = rand(3)

    puts "----------"
    puts "しょ！"
    puts "あなた → 『#{hand[hand_sign]}』を出しました"
    puts "相手　 → 『#{hand[enemy_hand]}』を出しました"
    puts "----------"

    if (hand_sign == 0 && enemy_hand == 2) || (hand_sign == 1 && enemy_hand == 0) || (hand_sign == 2 && enemy_hand == 1)
        $result_janken = 1
    elsif (hand_sign == 0 && enemy_hand == 1) || (hand_sign == 1 && enemy_hand == 2) || (hand_sign == 2 && enemy_hand == 0)
        $result_janken = 2
    else
        $result_janken = 3
    end

    # $result_janken 1→負け 2→勝ち 3→あいこ 
end



until $breakpoint == 1 do
    if $result_janken == 0
        janken
    elsif $result_janken == 1
        lose_pattern
    elsif $result_janken == 2
        win_pattern
    else
        draw_pattern
    end
end