CREATE TABLE `cart` (
  `userId` 		varchar(50) NOT NULL,
  `code` 		varchar(50) NOT NULL,
  `name` 		varchar(50) NOT NULL,
  `price` 		int 		NOT NULL,
  `count` 		int 		NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `user` (
  `userId` 			varchar(20) NOT NULL,
  `userPassword`	varchar(20) NOT NULL,
  `userName` 		varchar(20) NOT NULL,
  `userGender` 		varchar(20) NOT NULL,
  `userEmail` 		varchar(50) NOT NULL,
  `auth` 			varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE `product` (
  `code` 		varchar(50) NOT NULL,
  `name` 		varchar(50) NOT NULL,
  `info` 		varchar(50) NULL, -- 상품설명
  `price` 		int 		NOT NULL,
  `property` 	varchar(50) NULL, -- 상품속성(다이어트, 관절 ... 등)
  `imgPath` 	varchar(50) NOT NULL,
  `category` 	varchar(10) NOT NULL, -- (사료, 간식 구분)
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


INSERT INTO user VALUES('user1', '1234', '사용자1', '남자', 'user1@test.com', 'normal');
INSERT INTO user VALUES('user2', '1234', '사용자2', '여자', 'user2@test.com', 'normal');
INSERT INTO user VALUES('user3', '1234', '사용자3', '여자', 'user3@test.com', 'normal');
INSERT INTO user VALUES('user4', '1234', '사용자4', '여자', 'user4@test.com', 'normal');
INSERT INTO user VALUES('user5', '1234', '사용자5', '남자', 'user5@test.com', 'normal');
INSERT INTO user VALUES('admin', '1234', '관리자', '남자', 'admin@test.com', 'admin');



INSERT INTO product VALUES('P101', '프라이멀 케나인 치킨 포뮬라'			, '', 58000		, ''		, 'img1.png', 'F');
INSERT INTO product VALUES('P102', '오픈팜 동결건조 돼지고기'			, '', 49000		, 'C,D'		, 'img2.png', 'F');
INSERT INTO product VALUES('P103', '빅독 리틀바이트 램 동결건조'			, '', 23900		, 'C,D'		, 'img3.png', 'F');
INSERT INTO product VALUES('P104', '오리젠 피트 앤 트림'				, '', 33200		, 'A,D'		, 'img4.png', 'F');
INSERT INTO product VALUES('P105', '오픈팜 독 연어'					, '', 39000		, 'B,C'		, 'img5.png', 'F');
INSERT INTO product VALUES('P106', '빌리앤마것 독 야생 캥거루&비프'		, '', 41000		, 'C'		, 'img6.png', 'F');
INSERT INTO product VALUES('P107', '아카나 어덜트 스몰브리드'			, '', 23200		, ''		, 'img7.png', 'F');
INSERT INTO product VALUES('P108', '디어니스트키친 펌킨 포얼오버스 터키'		, '', 4500		, 'C'		, 'img8.png', 'F');
INSERT INTO product VALUES('P109', '스텔라앤츄이스 스튜 케이지 프리 치킨'	, '', 8500		, ''		, 'img9.png', 'F');

/*
A - 다이어트
B - 피부
C - 저알러지
D - 고단백
E - 관절
F - 소화
*/

INSERT INTO product VALUES('P201', '폴카독 베이커리 대구 껍질 크런치 스틱'		, '', 17850		, 'A,B'		, 'img1.png', 'S');
INSERT INTO product VALUES('P202', '지위픽 소고기 트릿'					, '', 9700		, 'E'		, 'img2.png', 'S');
INSERT INTO product VALUES('P203', '지위픽 램이어 구강간식'					, '', 16500		, ''		, 'img3.png', 'S');
INSERT INTO product VALUES('P204', '베어랜더랫 요거트'					, '', 26000		, 'F'		, 'img4.png', 'S');
INSERT INTO product VALUES('P205', '포틀랜드 펫푸드 습식 토퍼'				, '', 11000		, ''		, 'img5.png', 'S');
INSERT INTO product VALUES('P206', '더본즈앤코 케피어 산양유'				, '', 25000		, 'A,F'		, 'img6.png', 'S');
INSERT INTO product VALUES('P207', '올박스 파머스니블스'					, '', 12900		, ''		, 'img7.png', 'S');
INSERT INTO product VALUES('P208', '워프 비프 그린트라이프 동결건조 트릿'		, '', 10400		, 'E,F'		, 'img8.png', 'S');
INSERT INTO product VALUES('P209', '코코테라피 블루베리 트레이닝 트릿'			, '', 14200		, 'A,F'		, 'img9.png', 'S');