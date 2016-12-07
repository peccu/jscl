;;; early-char.lisp   ---  Character   things   needed   early  in   the
;;; cross-compilation

;; JSCL is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General  Public License as published by the Free
;; Software Foundation,  either version  3 of the  License, or  (at your
;; option) any later version.
;;
;; JSCL is distributed  in the hope that it will  be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should  have received a  copy of  the GNU General  Public License
;; along with JSCL. If not, see <http://www.gnu.org/licenses/>.
(in-package :jscl)
(/debug "loading early-char.lisp!")

;; This list  comes from SBCL:  everything that's ALPHA-CHAR-P,  but not
;; SB-IMPL::UCD-DECIMAL-DIGIT          (to          work          around
;; <https://bugs.launchpad.net/sbcl/+bug/1177986>),  then combined  into
;; a much smaller set of ranges. Yes, this can be compressed better.
(defvar +unicode-alphas+
  '((65 . 90) (97 . 122) (170 . 170) (181 . 181) (186 . 186) (192 . 214)
    (216 . 246) (248 . 705) (710 . 721) (736 . 740) (748 . 748) (750 . 750)
    (880 . 884) (886 . 887) (890 . 893) (902 . 902) (904 . 906) (908 . 908)
    (910 . 929) (931 . 1013) (1015 . 1153) (1162 . 1317) (1329 . 1366)
    (1369 . 1369) (1377 . 1415) (1488 . 1514) (1520 . 1522) (1569 . 1610)
    (1646 . 1647) (1649 . 1747) (1749 . 1749) (1765 . 1766) (1774 . 1775)
    (1786 . 1788) (1791 . 1791) (1808 . 1808) (1810 . 1839) (1869 . 1957)
    (1969 . 1969) (1994 . 2026) (2036 . 2037) (2042 . 2042) (2048 . 2069)
    (2074 . 2074) (2084 . 2084) (2088 . 2088) (2308 . 2361) (2365 . 2365)
    (2384 . 2384) (2392 . 2401) (2417 . 2418) (2425 . 2431) (2437 . 2444)
    (2447 . 2448) (2451 . 2472) (2474 . 2480) (2482 . 2482) (2486 . 2489)
    (2493 . 2493) (2510 . 2510) (2524 . 2525) (2527 . 2529) (2544 . 2545)
    (2565 . 2570) (2575 . 2576) (2579 . 2600) (2602 . 2608) (2610 . 2611)
    (2613 . 2614) (2616 . 2617) (2649 . 2652) (2654 . 2654) (2674 . 2676)
    (2693 . 2701) (2703 . 2705) (2707 . 2728) (2730 . 2736) (2738 . 2739)
    (2741 . 2745) (2749 . 2749) (2768 . 2768) (2784 . 2785) (2821 . 2828)
    (2831 . 2832) (2835 . 2856) (2858 . 2864) (2866 . 2867) (2869 . 2873)
    (2877 . 2877) (2908 . 2909) (2911 . 2913) (2929 . 2929) (2947 . 2947)
    (2949 . 2954) (2958 . 2960) (2962 . 2965) (2969 . 2970) (2972 . 2972)
    (2974 . 2975) (2979 . 2980) (2984 . 2986) (2990 . 3001) (3024 . 3024)
    (3077 . 3084) (3086 . 3088) (3090 . 3112) (3114 . 3123) (3125 . 3129)
    (3133 . 3133) (3160 . 3161) (3168 . 3169) (3205 . 3212) (3214 . 3216)
    (3218 . 3240) (3242 . 3251) (3253 . 3257) (3261 . 3261) (3294 . 3294)
    (3296 . 3297) (3333 . 3340) (3342 . 3344) (3346 . 3368) (3370 . 3385)
    (3389 . 3389) (3424 . 3425) (3450 . 3455) (3461 . 3478) (3482 . 3505)
    (3507 . 3515) (3517 . 3517) (3520 . 3526) (3585 . 3632) (3634 . 3635)
    (3648 . 3654) (3713 . 3714) (3716 . 3716) (3719 . 3720) (3722 . 3722)
    (3725 . 3725) (3732 . 3735) (3737 . 3743) (3745 . 3747) (3749 . 3749)
    (3751 . 3751) (3754 . 3755) (3757 . 3760) (3762 . 3763) (3773 . 3773)
    (3776 . 3780) (3782 . 3782) (3804 . 3805) (3840 . 3840) (3904 . 3911)
    (3913 . 3948) (3976 . 3979) (4096 . 4138) (4159 . 4159) (4176 . 4181)
    (4186 . 4189) (4193 . 4193) (4197 . 4198) (4206 . 4208) (4213 . 4225)
    (4238 . 4238) (4256 . 4293) (4304 . 4346) (4348 . 4348) (4352 . 4680)
    (4682 . 4685) (4688 . 4694) (4696 . 4696) (4698 . 4701) (4704 . 4744)
    (4746 . 4749) (4752 . 4784) (4786 . 4789) (4792 . 4798) (4800 . 4800)
    (4802 . 4805) (4808 . 4822) (4824 . 4880) (4882 . 4885) (4888 . 4954)
    (4992 . 5007) (5024 . 5108) (5121 . 5740) (5743 . 5759) (5761 . 5786)
    (5792 . 5866) (5888 . 5900) (5902 . 5905) (5920 . 5937) (5952 . 5969)
    (5984 . 5996) (5998 . 6000) (6016 . 6067) (6103 . 6103) (6108 . 6108)
    (6176 . 6263) (6272 . 6312) (6314 . 6314) (6320 . 6389) (6400 . 6428)
    (6480 . 6509) (6512 . 6516) (6528 . 6571) (6593 . 6599) (6656 . 6678)
    (6688 . 6740) (6823 . 6823) (6917 . 6963) (6981 . 6987) (7043 . 7072)
    (7086 . 7087) (7168 . 7203) (7245 . 7247) (7258 . 7293) (7401 . 7404)
    (7406 . 7409) (7424 . 7615) (7680 . 7957) (7960 . 7965) (7968 . 8005)
    (8008 . 8013) (8016 . 8023) (8025 . 8025) (8027 . 8027) (8029 . 8029)
    (8031 . 8061) (8064 . 8116) (8118 . 8124) (8126 . 8126) (8130 . 8132)
    (8134 . 8140) (8144 . 8147) (8150 . 8155) (8160 . 8172) (8178 . 8180)
    (8182 . 8188) (8305 . 8305) (8319 . 8319) (8336 . 8340) (8450 . 8450)
    (8455 . 8455) (8458 . 8467) (8469 . 8469) (8473 . 8477) (8484 . 8484)
    (8486 . 8486) (8488 . 8488) (8490 . 8493) (8495 . 8505) (8508 . 8511)
    (8517 . 8521) (8526 . 8526) (8579 . 8580) (11264 . 11310) (11312 . 11358)
    (11360 . 11492) (11499 . 11502) (11520 . 11557) (11568 . 11621)
    (11631 . 11631) (11648 . 11670) (11680 . 11686) (11688 . 11694)
    (11696 . 11702) (11704 . 11710) (11712 . 11718) (11720 . 11726)
    (11728 . 11734) (11736 . 11742) (11823 . 11823) (12293 . 12294)
    (12337 . 12341) (12347 . 12348) (12353 . 12438) (12445 . 12447)
    (12449 . 12538) (12540 . 12543) (12549 . 12589) (12593 . 12686)
    (12704 . 12727) (12784 . 12799) (13312 . 19893) (19968 . 40907)
    (40960 . 42124) (42192 . 42237) (42240 . 42508) (42512 . 42527)
    (42538 . 42539) (42560 . 42591) (42594 . 42606) (42623 . 42647)
    (42656 . 42725) (42775 . 42783) (42786 . 42888) (42891 . 42892)
    (43003 . 43009) (43011 . 43013) (43015 . 43018) (43020 . 43042)
    (43072 . 43123) (43138 . 43187) (43250 . 43255) (43259 . 43259)
    (43274 . 43301) (43312 . 43334) (43360 . 43388) (43396 . 43442)
    (43471 . 43471) (43520 . 43560) (43584 . 43586) (43588 . 43595)
    (43616 . 43638) (43642 . 43642) (43648 . 43695) (43697 . 43697)
    (43701 . 43702) (43705 . 43709) (43712 . 43712) (43714 . 43714)
    (43739 . 43741) (43968 . 44002) (44032 . 55203) (55216 . 55238)
    (55243 . 55291) (63744 . 64045) (64048 . 64109) (64112 . 64217)
    (64256 . 64262) (64275 . 64279) (64285 . 64285) (64287 . 64296)
    (64298 . 64310) (64312 . 64316) (64318 . 64318) (64320 . 64321)
    (64323 . 64324) (64326 . 64433) (64467 . 64829) (64848 . 64911)
    (64914 . 64967) (65008 . 65019) (65136 . 65140) (65142 . 65276)
    (65313 . 65338) (65345 . 65370) (65382 . 65470) (65474 . 65479)
    (65482 . 65487) (65490 . 65495) (65498 . 65500) (65536 . 65547)
    (65549 . 65574) (65576 . 65594) (65596 . 65597) (65599 . 65613)
    (65616 . 65629) (65664 . 65786) (66176 . 66204) (66208 . 66256)
    (66304 . 66334) (66352 . 66368) (66370 . 66377) (66432 . 66461)
    (66464 . 66499) (66504 . 66511) (66560 . 66717) (67584 . 67589)
    (67592 . 67592) (67594 . 67637) (67639 . 67640) (67644 . 67644)
    (67647 . 67669) (67840 . 67861) (67872 . 67897) (68096 . 68096)
    (68112 . 68115) (68117 . 68119) (68121 . 68147) (68192 . 68220)
    (68352 . 68405) (68416 . 68437) (68448 . 68466) (68608 . 68680)
    (69763 . 69807) (73728 . 74606) (77824 . 78894) (119808 . 119892)
    (119894 . 119964) (119966 . 119967) (119970 . 119970) (119973 . 119974)
    (119977 . 119980) (119982 . 119993) (119995 . 119995) (119997 . 120003)
    (120005 . 120069) (120071 . 120074) (120077 . 120084) (120086 . 120092)
    (120094 . 120121) (120123 . 120126) (120128 . 120132) (120134 . 120134)
    (120138 . 120144) (120146 . 120485) (120488 . 120512) (120514 . 120538)
    (120540 . 120570) (120572 . 120596) (120598 . 120628) (120630 . 120654)
    (120656 . 120686) (120688 . 120712) (120714 . 120744) (120746 . 120770)
    (120772 . 120779) (131072 . 173782) (173824 . 177972) (194560 . 195101))
  "(Start . End) ranges of codepoints for alphabetic characters, as of Unicode 6.2.")

(defun jscl/cl::alpha-char-p (char)
  (let ((code (char-code char)))
    (dolist (alpha-pair +unicode-alphas+)
      (when (<= (car alpha-pair) code (cdr alpha-pair))
        (return-from jscl/cl::alpha-char-p t)))
    nil))

;; I made this  list by running DIGIT-CHAR-P in SBCL  on every codepoint
;; up    to   CHAR-CODE-LIMIT,    filtering   on    only   those    with
;; SB-IMPL::UCD-GENERAL-CATEGORY 12 (Nd),  and then grouping consecutive
;; sets. There's 37 spans of 10, plus 1 extra digit (6618).
(defvar +unicode-zeroes+
  '(48 1632 1776 1984 2406 2534 2662 2790 2918 3046 3174 3302 3430 3664
    3792 3872 4160 4240 6112 6160 6470 6608 6784 6800 6992 7088 7232 7248
    42528 43216 43264 43472 43600 44016 65296 66720 120782)
  "Unicode codepoints which have Digit value 0, followed by 1, 2, ..., 9, as of Unicode 6.2")

;; The "Digit  value" of a  (Unicode) character,  or NIL, if  it doesn't
;; have one.
(defun unicode-digit-value (char)
  (let ((code (char-code char)))
    (dolist (z +unicode-zeroes+)
      (when (<= z code (+ z 9))
        (return-from unicode-digit-value (- code z))))
    (when (= code 6618) ; it's special!
      1)))

;; From comment #4 on <https://bugs.launchpad.net/sbcl/+bug/1177986>:
(defun jscl/cl::digit-char-p (char &optional (radix 10))
  "Includes ASCII 0-9 a-z A-Z, plus any Unicode decimal digit characters or fullwidth variants A-Z."
  ;; Check-Type   not  available   yet.   This  could   maybe  move   to
  ;; char.lisp though?
  (unless (and (characterp char)
               (integerp radix)
               (<= 2 radix 36))
    (error "Type error"))
  (let* ((radix (or (and radix (<= 2 radix 36) radix) 10))
         (number (unicode-digit-value char))
         (code (char-code char))
         (upper (char-upcase char))
         (code-upper (char-code upper))
         (potential (cond (number number)
                          ((char<= #\A upper #\Z)
                           (+ 10 (- code-upper (char-code #\A))))
                          ((<= 65313 code-upper 65338) ; FULLWIDTH_LATIN_CAPITAL_LETTER_A - _Z
                           (+ 10 (- code-upper 65313)))
                          (t nil))))
    (and potential (< potential radix) potential)))

(defun jscl/cl::digit-char (weight &optional (radix 10))
  "All arguments must be integers. Returns a character object that represents
a digit of the given weight in the specified radix. Returns NIL if no such
character exists."
  (and (>= weight 0) (< weight radix) (< weight 36)
       (or (and (<= 0 weight 9)
                (code-char (+ (char-code #\0) weight)))
           (and (<= 10 weight 36)
                (code-char (+ (char-code #\A) (- weight 10)))))))
