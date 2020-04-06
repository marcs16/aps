$(document).ready(function($) {

    'use strict';
        $('.tabgroup > div').hide();
            $('.tabgroup > div:first-of-type').show();
            $('.tabs a').click(function(e){
              e.preventDefault();
                var $this = $(this),
                tabgroup = '#'+$this.parents('.tabs').data('tabgroup'),
                others = $this.closest('li').siblings().children('a'),
                target = $this.attr('href');
            others.removeClass('active');
            $this.addClass('active');
            $(tabgroup).children('div').hide();
            $(target).show();
          
        })



        var contentSection = $('.sidebar-navigation');
        var navigation = $('nav');
        
        
        contentSection.each(function() {
            $(this).click(function(event) {
               $(this).addClass('active-section')
               setTimeout(function(){$('#someid').RemoveClass('active-section');}, 2000);
            });
                
            
        });
        /////FUNCTIONS
        function updateNavigation(){
            contentSection.each(function(){
                var sectionName = $(this).attr('id');
                var navigationMatch = $('nav a[href="#' + sectionName + '"]');
                if( ($(this).offset().top - $(window).height()/2 < $(window).scrollTop()) &&
                      ($(this).offset().top + $(this).height() - $(window).height()/2 > $(window).scrollTop()))
                    {
                        navigationMatch.addClass('active-section');
                    }
                else {
                    navigationMatch.removeClass('active-section');
                }
            });
        }
        function smoothScroll(target){
            $('body,html').animate({
                scrollTop: target.offset().top
            }, 800);
        }


       

});