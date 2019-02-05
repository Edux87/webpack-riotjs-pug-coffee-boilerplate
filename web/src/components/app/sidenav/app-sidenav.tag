app-sidenav
  ul#slide-out.sidenav
    li
      .user-view
        .background
          img(src='https://placeimg.com/640/480/nature')
        a(href='#user')
          img.circle(src='https://placeimg.com/50/50/people')
        a(href='#name')
          span.white-text.name John Doe
        a(href='#email')
          span.white-text.email jdandturk@gmail.com
    li
      a(href='#!')
        i.material-icons cloud
        | First Link With Icon
    li
      a(href='#!')
        i.material-icons delete
        | First Link With Icon
    li
      .divider
    li
      a.subheader Subheader
    li
      a.waves-effect(href='#!') Third Link With Waves
  a.sidenav-trigger(href='#', data-target='slide-out')
    i.material-icons menu
