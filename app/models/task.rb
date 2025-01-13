class Task < ApplicationRecord
  # バリデーションの設定
  validates :title, presence: { message: "は必須項目です" }, length: { maximum: 20, message: "は20文字以内で入力してください" }
  validates :memo, length: { maximum: 500, message: "は500文字以内で入力してください" }
  validates :start_date, presence: { message: "は必須項目です" }
  validates :end_date, presence: { message: "は必須項目です" }

  # エラーの定義は{}内で行っているためerrors.addを実装する必要はない

  validate :end_date_after_start_date
  # validates（例: presence, length, numericality）ではカバーできない検証を行いたいときに便利です。
  
  private
  # カスタムバリデーションメソッド
  def end_date_after_start_date
    # 開始日または終了日が空の場合はチェックをスキップ
    return if end_date.blank? || start_date.blank?

    # 終了日が開始日より前の場合にエラーを追加
    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付にしてください")
    end
  end

end