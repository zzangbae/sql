-- 중고 거래 게시물을 3건 이상 등록한 사용자
-- 사용자 ID, 닉네임, 전체주소, 전화번호
-- 전화번호의 경우 - 삽입
-- 회원ID 기준 내림차순
SELECT
u.USER_ID,
u.NICKNAME,
CONCAT(CITY, " ", u.STREET_ADDRESS1, " ", u.STREET_ADDRESS2) 전체주소,
# TLNO
CONCAT(SUBSTR(TLNO, 1, 3), '-', SUBSTR(TLNO, 4, 4), '-', SUBSTR(TLNO, 8, 4)) 전화번호
FROM
USED_GOODS_BOARD b JOIN USED_GOODS_USER u
ON b.WRITER_ID = u.USER_ID
GROUP BY u.USER_ID
HAVING COUNT(*) >= 3
ORDER BY USER_ID DESC;