{* Название компонента, вынесено в переменную для удобства *}
{$component = 'ls-usercard'}

{* Параметры компонента *}
{component_define_params params=[ 'user', 'mods', 'classes', 'attributes' ]}

{* Основной блок компонента *}
<div class="{$component} {cmods name=$component mods=$mods} {$classes}" {cattr list=$attributes}>
    {* Аватарка пользователя *}
    <a href="{$user->getUserWebPath()}" class="ls-usercard__image-link">
        <img src="{$user->getProfileAvatarPath(100)}" alt="{$user->getProfileName()}" class="ls-usercard__image">
    </a>

    {* Имя пользователя *}
    <div class="ls-usercard__name">
        {$user->getDisplayName()|escape}
    </div>

    {* Не показываем кнопку если карточка пренадлежит текущему авторизованному пользователю *}
    {if $oUserCurrent && $oUserCurrent->getId() != $user->getId()}
        {* Кнопка отписаться/подписаться *}
        {* Используем компонент button *}
        {* Добавляем класс ls-button--primary если мы уже подписаны на пользователя *}
        {component 'button'
            text=(( $user->isFollow() ) ? 'Отписаться' : 'Подписаться')
            classes="ls-usercard__follow js-usercard-follow {if $user->isFollow()}ls-button--primary{/if}"
            attributes=[
                'data-login' => $user->getLogin(),
                'data-id' => $user->getId()
            ]}
    {/if}
</div>