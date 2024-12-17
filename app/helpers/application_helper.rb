module ApplicationHelper
    def default_meta_tags
        {
          site: 'Bi-ha-ichinitinishite-narazu',
          title: '美は一日にしてならず',
          reverse: true,
          charset: 'utf-8',
          description: '美は一日にしてならずで、自分を磨こう！',
          keywords: '美,日記,投稿,にっき,共有,美容',
          canonical: request.original_url,
          separator: '|',
          icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('binari1.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg/svg' },
      ],
          og: {
            site_name: :site,
            title: :title,
            description: :description,
            type: 'website',
            url: request.original_url,
            image: image_url('binari1.png'), # 配置するパスやファイル名によって変更すること
            local: 'ja-JP'
          },
          # Twitter用の設定を個別で設定する
          twitter: {
            card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
            site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
            image: image_url('binari1.png') # 配置するパスやファイル名によって変更すること
          }
        }
      end
end

