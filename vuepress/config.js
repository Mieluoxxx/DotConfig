module.exports = {
  // 语言  
  locales: {
    '/': {
      lang: 'zh-CN'
    }
  },
  theme : 'reco',
  title: '真真夜夜的博客',
  description: '一个平平无奇的小站',

  themeConfig: {
    // 主题模式 博客模式
    type: "blog",
    author: "真真夜夜",
    logo: "/avatar.png",
    // 个人信息的头像
    authorAvatar: "/avatar2.png",
    // 内置搜索
    search: true,
    searchMaxSuggestions: 10,
    // 子侧边栏
    subSidebar: "auto",
    lastUpdated: '上次更新',
    // 博客配置
    blogConfig: {
      category: {
        location: 2, // 在导航栏菜单中所占的位置，默认2
        text: "博客", // 默认文案 “分类”
      },
      tag: {
        location: 4, // 在导航栏菜单中所占的位置，默认4
        text: "Tag", // 默认文案 “标签”
      },
      socialLinks: [
        {icon: 'reco-github', link: 'https://github.com/SongJian-99'}
      ]
    },

    // 导航栏配置
     nav: [
      { text: "首页", link: "/" },
      { text: "其他站点", 
        items: [
          { text: "Github", link: "https://github.com/Mieluoxxx"},
          { text: "SiriusX", link: "https://tinyurl.com/sirius-xopen"}
        ],
      }
    ],
  },

  plugins: [
  ]
}