$(function() {

	eventRegist();
})

function eventRegist(){
	
	$('[id^="article-title-"]').each(function(i,title){
		$(title).on('click',function(){
			setArticleModal($(this).attr('id').split('-')[2]);
			$('#ggv-modal').modal('show');
		});
	});
}

function setArticleModal(num){
	alert('modal open');
	var article=articlelist.find(article => article.article_id==num);
	$('#article-modal-title').html(article.article_title);
	
}