/**
 * 格式化工具函数
 * 支持多语言和千分位格式化
 */

/**
 * 支持的日期格式化选项
 */
interface DateFormatOptions {
  year?: 'numeric' | '2-digit';
  month?: 'numeric' | '2-digit' | 'long' | 'short' | 'narrow';
  day?: 'numeric' | '2-digit';
  hour?: 'numeric' | '2-digit';
  minute?: 'numeric' | '2-digit';
  second?: 'numeric' | '2-digit';
}

/**
 * 支持的语言列表
 */
type SupportedLocale = 'zh-CN' | 'zh-TW' | 'en-US' | 'en-GB' | 'ja-JP' | 'ko-KR' | 'de-DE' | 'fr-FR' | 'es-ES';

/**
 * 默认日期格式预设
 */
const dateFormatPresets: Record<string, DateFormatOptions> = {
  short: { year: 'numeric', month: 'numeric', day: 'numeric' },
  medium: { year: 'numeric', month: 'short', day: 'numeric' },
  long: { year: 'numeric', month: 'long', day: 'numeric' },
  full: { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' },
  'zh-CN': { year: 'numeric', month: 'long', day: 'numeric' },
  'zh-TW': { year: 'numeric', month: 'long', day: 'numeric' },
  'en-US': { year: 'numeric', month: 'short', day: 'numeric' },
  'en-GB': { year: 'numeric', month: 'short', day: 'numeric' },
};

/**
 * 格式化日期
 * @param date - 要格式化的日期（Date 对象、时间戳或日期字符串）
 * @param locale - 语言区域（默认 'zh-CN'）
 * @param options - 格式化选项或预设名称
 * @returns 格式化后的日期字符串
 *
 * @example
 * formatDate(new Date(), 'zh-CN') // "2026年3月10日"
 * formatDate(new Date(), 'en-US', 'medium') // "Mar 10, 2026"
 * formatDate(new Date(), 'zh-CN', { year: 'numeric', month: '2-digit', day: '2-digit' }) // "2026/03/10"
 */
export function formatDate(
  date: Date | number | string,
  locale: SupportedLocale = 'zh-CN',
  options: DateFormatOptions | keyof typeof dateFormatPresets = 'short'
): string {
  const dateObj = date instanceof Date ? date : new Date(date);

  // 检查日期是否有效
  if (isNaN(dateObj.getTime())) {
    throw new Error('Invalid date provided');
  }

  // 解析选项（如果是预设名称）
  const formatOptions: DateFormatOptions =
    typeof options === 'string'
      ? dateFormatPresets[options] || dateFormatPresets.short
      : options;

  return dateObj.toLocaleDateString(locale, formatOptions as Intl.DateTimeFormatOptions);
}

/**
 * 格式化数字（支持千分位）
 * @param num - 要格式化的数字或数字字符串
 * @param locale - 语言区域（默认 'zh-CN'）
 * @param decimals - 小数位数（默认 0）
 * @param options - 额外的 Intl.NumberFormat 选项
 * @returns 格式化后的数字字符串
 *
 * @example
 * formatNumber(1234567.89) // "1,234,568"
 * formatNumber(1234567.89, 'en-US', 2) // "1,234,567.89"
 * formatNumber(1234567.89, 'de-DE', 2) // "1.234.567,89"
 * formatNumber(0.1234, 'zh-CN', 2, { style: 'percent' }) // "12.34%"
 */
export function formatNumber(
  num: number | string,
  locale: SupportedLocale = 'zh-CN',
  decimals: number = 0,
  options?: Omit<Intl.NumberFormatOptions, 'minimumFractionDigits' | 'maximumFractionDigits'>
): string {
  const numericValue = typeof num === 'string' ? parseFloat(num) : num;

  // 检查是否为有效数字
  if (isNaN(numericValue) || !isFinite(numericValue)) {
    throw new Error('Invalid number provided');
  }

  const formatOptions: Intl.NumberFormatOptions = {
    minimumFractionDigits: decimals,
    maximumFractionDigits: decimals,
    useGrouping: true, // 启用千分位分隔符
    ...options,
  };

  return numericValue.toLocaleString(locale, formatOptions);
}

/**
 * 格式化货币金额
 * @param amount - 金额数值
 * @param currency - 货币代码（如 'CNY', 'USD', 'EUR'）
 * @param locale - 语言区域（默认 'zh-CN'）
 * @param decimals - 小数位数（默认 2）
 * @returns 格式化后的货币字符串
 *
 * @example
 * formatCurrency(1234567.89, 'CNY') // "¥1,234,567.89"
 * formatCurrency(1234567.89, 'USD', 'en-US') // "$1,234,567.89"
 * formatCurrency(1234567.89, 'EUR', 'de-DE') // "1.234.567,89 €"
 */
export function formatCurrency(
  amount: number | string,
  currency: string,
  locale: SupportedLocale = 'zh-CN',
  decimals: number = 2
): string {
  const numericValue = typeof amount === 'string' ? parseFloat(amount) : amount;

  if (isNaN(numericValue) || !isFinite(numericValue)) {
    throw new Error('Invalid amount provided');
  }

  return numericValue.toLocaleString(locale, {
    style: 'currency',
    currency: currency,
    minimumFractionDigits: decimals,
    maximumFractionDigits: decimals,
  });
}

/**
 * 格式化文件大小
 * @param bytes - 字节数
 * @param locale - 语言区域（默认 'zh-CN'）
 * @param decimals - 小数位数（默认 2）
 * @returns 格式化后的文件大小字符串
 *
 * @example
 * formatFileSize(1024) // "1.00 KB"
 * formatFileSize(1234567) // "1.18 MB"
 * formatFileSize(1234567890) // "1.15 GB"
 */
export function formatFileSize(
  bytes: number,
  locale: SupportedLocale = 'zh-CN',
  decimals: number = 2
): string {
  if (bytes === 0) return '0 B';

  const k = 1024;
  const sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));

  const formattedValue = parseFloat((bytes / Math.pow(k, i)).toFixed(decimals));

  return `${formatNumber(formattedValue, locale, decimals, { useGrouping: true })} ${sizes[i]}`;
}

/**
 * 格式化百分比
 * @param value - 数值（如 0.1234 表示 12.34%）
 * @param locale - 语言区域（默认 'zh-CN'）
 * @param decimals - 小数位数（默认 2）
 * @returns 格式化后的百分比字符串
 *
 * @example
 * formatPercent(0.1234) // "12.34%"
 * formatPercent(0.5, 'en-US', 0) // "50%"
 */
export function formatPercent(
  value: number,
  locale: SupportedLocale = 'zh-CN',
  decimals: number = 2
): string {
  return formatNumber(value, locale, decimals, { style: 'percent' });
}
