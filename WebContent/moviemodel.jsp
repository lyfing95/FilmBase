<%@ page language="java" import="java.util.*,com.lyf.filmbase.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html>
<head>
	<base href="<%=basePath%>">
    <title>FilmBase | 首页</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="static/source/css/movie.css">
    <script src="static/source/js/movie.js"></script>
    
</head>
<body>
	<div id="hd">
		<h1><a href="movie.html">影视基地</a></h1>
		<div class="search-box">
			<form name="form" method="get" action="">
				<input type="text" name="searchText" class="search-text" value="电影、影人、影院"/>
				<input type="submit" name="searchBtn" class="search-btn" value="搜索" />
			</form>
		</div>
		<ul id="main-menu">
			<li><a href="#">影讯购票</a></li>
			<li><a href="#">最新热映</a></li>
			<li><a href="#">影片分类</a></li>
			<li><a href="#">排行榜</a></li>
			<li><a href="#">口碑影线</a></li>
		</ul>
		<div class="login-set">
			<a href="register.jsp">注册</a>
			<a href="login.jsp">登录</a>
			<a href="index.jsp">个人设置</a>
		</div>
	</div>
	
	
	<div id="bd">
		<div class="ad">
			<a href="#"><img src="" /></a>
		</div>
		<div class="movie-show">
		<div class="rightnow">
			<span class="rn">正在热映</span>
			<span ><a href="#" class="alln">全部正在热映>></a></span>
			<div class="scroll-btn">
				<span id="show-page">1/5</span>
				<input type="button"  name="prev"  class="prev" value="上一页" />
				<input type="button"  name="prev"  class="next" value="下一页" />
			</div>
			<div class="piclist">
				<ul>
					<li>
						<a href="#"><img src="images/movie/a1.jpg" /></a>
						<h3><a href="#">烈日灼心</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span>7.9</span></div>
						<input type="button" name="buy" class="buy-btn"  value="选座购票" onclick="javascrtpt:window.location.href='login.jsp'" /> 
					</li>
					<li>
						<a href="#"><img src="images/movie/a2.jpg" /></a>
						<h3><a href="#">终结者：创世纪</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star4.png" /><img src="images/star2.png" /><span>6.9</span></div>
						<input type="button" name="buy" class="buy-btn" value="选座购票" onclick="javascrtpt:window.location.href='seat.jsp'"/>
					</li>
					<li>
						<a href="#"><img src="images/movie/a3.jpg" /></a>
						<h3><a href="#">刺客聂隐娘</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span>7.5</span></div>
						<input type="button" name="buy" class="buy-btn" value="选座购票" onclick="javascrtpt:window.location.href='seat.jsp'"/>
					</li>
					<li>
						<a href="#"><img src="images/movie/a4.jpg" /></a>
						<h3><a href="#">双生灵</a></h3>
						<div class="score"><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><img src="images/star2.png" /><img src="images/star2.png" /><span>3.5</span></div>
						<input type="button" name="buy" class="buy-btn" value="选座购票" onclick="javascrtpt:window.location.href='seat.jsp'"/>
					</li>
				</ul>
			</div>
		</div>
		<div class="hot-movie">
			<span class="rn">热门电影</span>
			<span><a href="#" class="morem">更多>></a></span>
			<div class="s-piclist">
				<ul>
					<li>
						<a href="#"><img src="images/movie/b1.jpg" /></a>
						<h3><a href="#" title="捉妖记">捉妖记</a></h3>
						<input type="button" name="buy" class="buy-btn" value="查影讯" />
					</li>
					<li>
						<a href="#"><img src="images/movie/a1.jpg" /></a>
						<h3><a href="#" title="烈日灼心">烈日灼心</a></h3>
						<input type="button" name="buy" class="buy-btn" value="查影讯" />
					</li>
					<li>
						<a href="#"><img src="images/movie/b2.jpg" /></a>
						<h3><a href="#" title="滚蛋吧!肿瘤君">滚蛋吧！肿瘤君</a></h3>
						<input type="button" name="buy" class="buy-btn" value="查影讯" />
					</li>
					<li>
						<a href="#"><img src="images/movie/a2.jpg" /></a>
						<h3><a href="#" title="终结者：创世纪">终结者：创世纪</a></h3>
						<input type="button" name="buy" class="buy-btn" value="查影讯" />
					</li>
					<li>
						<a href="#"><img src="images/movie/b3.jpg" /></a>
						<h3><a href="#" title="西游记之大圣归来">西游记之大圣归来</a></h3>
						<input type="button" name="buy" class="buy-btn" value="查影讯" />
					</li>
				</ul>
			</div>
		</div>
        <div class="hot-movie">
			<span class="rn">即将上映</span>
			<span><a href="#" class="morem">更多>></a></span>
			<div class="s-piclist">
				<ul>
					<li>
						<a href="#"><img src="images/movie/c1.jpg" /></a>
						<h3><a href="#" title="碟中谍5：神秘国度">碟中谍5：神秘国度</a></h3>
						<p>9月8日上映</p>
					</li>
					<li>
						<a href="#"><img src="images/movie/c4.jpg" /></a>
						<h3><a href="#" title="小黄人大眼萌">小黄人大眼萌</a></h3>
						<p>9月13日上映</p>
					</li>
					<li>
						<a href="#"><img src="images/movie/c2.jpg" /></a>
						<h3><a href="#" title="第三种爱情">第三种爱情</a></h3>
						<p>9月25日上映</p>
					</li>
					<li>
						<a href="#"><img src="images/movie/c3.jpg" /></a>
						<h3><a href="#" title="港囧">港囧</a></h3>
						<p>9月25日上映</p>
					</li>
					<li>
						<a href="#"><img src="images/movie/c5.jpg" /></a>
						<h3><a href="#" title="解救吾先生">解救吾先生</a></h3>
						<p>9月30日上映</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="pop-comment">
			<span class="rn">最受欢迎的影评</span>
			<span><a href="#" class="morem">更多热门影评>></a></span>
			<div class="long-comment">
				<ul class="pic-text">
					<li>
						<a href="#"><img src="images/movie/a3.jpg" /></a>
					    <div class="comment-text">
						<h3><a href="#">李白的《聂隐娘》还是杜甫的《聂隐娘》？</a></h3>
						<div class="score"><span>CyberKnight电子骑士 评论 《刺客聂隐娘》</span><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span class="star"></span></div>
						<p>对侯孝贤导演的这部《刺客聂隐娘》，我的看法概况起来四个字：有感无爱。影片称得上是佳作，但怕还算不得经典。侯孝贤的片子我看得不多，依友人的说法，感觉在侯导的影片中，这部也归不到最出色一类里。这不是看得懂看不懂的问题。如果按单项来说，我认为...<a href="#">(全文)</a></p>
					    </div>
					</li>
					<li>
						<a href="#"><img src="images/movie/b2.jpg" /></a>
						<div class="comment-text">
						<h3><a href="#">弃捐勿复道，努力加餐饭。其余都滚蛋。</a></h3>
						<div class="score">师弟怕师兄 评论 《滚蛋吧！肿瘤君》<img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><img src="images/star2.png" /><span class="star"><span class="star"></span></div>
						<p>《滚蛋吧，肿瘤君》这部片子选择的档期很好。正值炎炎暑假，除了影院自带冷气，片子一开头便又给了一个夸张的彻骨寒冷。失业+失恋我的心伤到全世界都似冰冻，大夏天拿着冰激凌掉进了冰窟窿。生命本是无常，不如意十之八九，能与人道......<a href="#">(全文)</a></p>
					    </div>
					</li>
					<li>
						<a href="#"><img src="images/movie/d1.jpg" /></a>
					    <div class="comment-text">
						<h3><a href="#">【高能预警】《花千骨》告诉我们的人生道理</a></h3>
						<div class="score"><span>LoukasTC 评论: 《花千骨》</span><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span class="star"></span></div>
						<p>文_LoukasTC 从傻白甜女白领穿越到古代惑乱阿哥，再到惊情四百年，外星猛男守护superstar，如今又到高能上仙与末世妖神师徒虐恋，人类已经不能阻止自我意淫像洪水猛兽一般席卷而来，将正常的生活吞噬，带来一场让我们在无人处可以恣意变身的狂狷之梦。这梦早不是儿时一个会跟小鸟唱歌的辛德瑞拉可以唤醒的......... <a href="#">(全文)</a></p>
					    </div>
					</li>
					<li>
						<a href="#"><img src="images/movie/a1.jpg" /></a>
					    <div class="comment-text">
						<h3><a href="#">卓尔不群的遗憾</a></h3>
						<div class="score"><span>铁志 评论: 《烈日灼心》</span><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star1.png" /><img src="images/star2.png" /><span class="star"></span></div>
						<p>开场眼前一亮，雨戏拍的很好，节奏、氛围面面俱到，甚至让我想起了《七宗罪》的大雨，可到了中段，影片的悬念感一直处在自我感觉良好的处境，反复交代的线索，低估了观众的敏感也拖慢了影片的节奏，加上请感线的笔墨让风格在剧情和犯罪间不够统一，巧合太多，线索分散，最终也没有慎密的交代。但就人物的........<a href="#">(全文)</a></p>
					    </div>
					</li>
				</ul>
			</div>
		</div>
		</div>
		<div class="movie-type">
			<div class="type">
				<span class="rn">影片分类</span>
				<div class="type-text">
					<ul>
						<li><a href="#">爱情</a></li>
						<li><a href="#">悬疑</a></li>
						<li><a href="#">恐怖</a></li>
						<li><a href="#">文艺</a></li>
						<li><a href="#">喜剧</a></li>
						<li><a href="#">科幻</a></li>	
						<li><a href="#">玄幻</a></li>							
						<li><a href="#">战争</a></li>
						<li><a href="#">动画</a></li>
						<li><a href="#">动作</a></li>
						<li><a href="#">传记</a></li>
						<li><a href="#">纪录片</a></li>
					</ul>
				</div>
			</div>
			<div class="cinema">
				<span class="rn">影院</span><span><a href="#" class="morem">更多>></a></span>
				<div class="cinema-text">
					<ul>
						<li>
							<a href="#">CGV星聚汇影城（奥山世纪店）</a>
							<p>青山区和平大道809号奥山世纪城广场3楼</p>
							<span class="span-style1">座</span><span class="span-style1">可退票</span><span class="span-style1">卖品</span><span class="span-style1">IMAX厅</span><span class="span-style2">多影片优惠</span>
						</li>
						<li>
							<a href="#">金逸影城（销品茂IMAX店）</a>
							<p>武昌区武昌徐东大街18号销品茂5楼</p>
							<span class="span-style1">座</span><span class="span-style1">IMAX厅</span><span class="span-style2">多影片优惠</span>
						</li>
						<li>
							<a href="#">万达国际影城（汉街店）</a>
							<p>洪山区水果湖楚河汉街1号万达广场五层</p>
							<span class="span-style1">座</span><span class="span-style1">可退票</span><span class="span-style1">IMAX厅</span><span class="span-style2">多影片优惠</span>
						</li>	
						<li>
							<a href="#">百老汇影城（江汉路天汇店）</a>
							<p>江岸区江汉路118号港澳中心新世界时尚广场</p>
							<span class="span-style1">座</span><span class="span-style2">多影片优惠</span>
						</li>
						<li>
							<a href="#">摩尔国际电影城（城市广场店）</a>
							<p>江岸区后湖大道111号汉口城市广场A座3楼</p>
							<span class="span-style1">座</span><span class="span-style1">卖品</span><span class="span-style2">碟中谍预售</span><span class="span-style2">小黄人预售</span>
						</li>								
					</ul>
				</div>
			</div>
			<div class="list">
				<span class="rn">本周口碑榜</span>
				<div class="list-text">
					<ol>
						<li><a href="#">烈日灼心</a></li>
						<li><a href="#">刺客聂隐娘</a></li>
						<li><a href="#">西游记之大圣归来</a></li>
						<li><a href="#">滚蛋吧！肿瘤君</a></li>
						<li><a href="#">捉妖记</a></li>
						<li><a href="#">终结者：创世纪</a></li>
						<li><a href="#">这里的黎明静悄悄</a></li>
						<li><a href="#">亚马逊萌猴奇遇记</a></li>
						<li><a href="#">落跑吧！爱情</a></li>
						<li><a href="#">恋爱中的城市</a></li>
					</ol>
				</div>
			</div>
			<div class="about">
				<span class="rn">关于</span>
				<div class="about-content">
				</div>
			</div>
		</div>
	</div>
	<div id="ft">
		<span>关于电影网</span><a href="#">联系我们</a>
		<span class="ft-span">all rights reserved</span>
	</div>
</body>
</html>