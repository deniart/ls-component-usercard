(function($) {
    "use strict";

    $.widget( "livestreet.lsUsercard", $.livestreet.lsComponent, {
        /**
         * Дефолтные опции
         */
        options: {
            // Ссылки
            urls: {
                // Подписаться
                follow: aRouter['stream'] + 'ajaxadduser/',
                // Отписаться
                unfollow: aRouter['stream'] + 'ajaxremoveuser/'
            },

            // Селекторы
            selectors: {
                // Кнопка подписаться/отписаться
                follow: '.js-usercard-follow'
            }
        },

        /**
         * Конструктор
         *
         * @constructor
         * @private
         */
        _create: function () {
            this._super();

            // Иниц-ия кнопка подписки
            // Используем уже готовый jQuery плагин из компонента user
            this.elements.follow.lsUserFollow({
                urls: this.options.urls,
                classes: {
                    active: 'ls-button--primary'
                }
            });
        }
    });
})(jQuery);