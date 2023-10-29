-- 조회수가 가장 높은 중고거래 게시물
-- 첨부파일경로
-- FILE ID 내림차순
-- /home/grep/src/ + 게시글ID, 파일ID, 파일이름, 파일확장자
SELECT
CONCAT("/home/grep/src/", f.BOARD_ID, "/", f.FILE_ID, f.FILE_NAME, f.FILE_EXT) FILE_PATH
FROM USED_GOODS_FILE f JOIN USED_GOODS_BOARD b
ON f.BOARD_ID = b.BOARD_ID
WHERE f.BOARD_ID = (
    SELECT BOARD_ID
    FROM USED_GOODS_BOARD
    ORDER BY VIEWS DESC
    LIMIT 1
)
ORDER BY FILE_ID DESC;