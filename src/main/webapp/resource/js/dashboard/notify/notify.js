$(document).ready(function() {
	console.log("=======notify.js=======")
})


 const TYPES = ['info', 'warning', 'success', 'error'],
        TITLES = {
            'info': 'Notice!',
            'success': 'Awesome!',
            'warning': 'Watch Out!',
            'error': 'Doh!'
        },
        CONTENT = {
            'info': 'Hello, world! This is a toast message.',
            'success': 'The action has been completed.',
            'warning': 'It\'s all about to go wrong',
            'error': 'It all went wrong.'
        },
        POSITION = ['top-right', 'top-left', 'top-center', 'bottom-right', 'bottom-left', 'bottom-center', 'fix-position'];

    $.toastDefaults.position = 'fix-position';
    $.toastDefaults.dismissible = true;
    $.toastDefaults.stackable = true;
    $.toastDefaults.pauseDelayOnHover = true;

    $('.snack').click(function () {
        var type = TYPES[Math.floor(Math.random() * TYPES.length)],
            content = CONTENT[type];

        $.snack(type, content);
    });

    $('.toast-btn').click(function () {
        var rng = Math.floor(Math.random() * 2) + 1,
            type = TYPES[Math.floor(Math.random() * TYPES.length)],
            title = TITLES[type],
            content = CONTENT[type];

        if (rng === 1) {
            $.toast({
                type: type,
                title: title,
                subtitle: '11 mins ago',
                content: content
            });
        } else {
            $.toast({
                type: type,
                title: title,
                subtitle: '11 mins ago',
                content: content,
                img: {
                    src: 'https://via.placeholder.com/20',
                    alt: 'Image'
                }
            });
        }
    });